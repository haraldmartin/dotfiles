# Initialize Homebrew first (before oh-my-zsh)
if [[ -e '/opt/homebrew' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
fi

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="refined"

COMPLETION_WAITING_DOTS="true"

# Don't ask before loading .env files
ZSH_DOTENV_PROMPT=false

plugins=(
  dotenv
  git
  fabric
  ssh
  ruby
  brew
  iterm2
  zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh-plugins/fzf-git.sh/fzf-git.sh

# show bg jobs in prompt
export PROMPT="%(1j. %j .)$PROMPT"

# PATH (Homebrew paths already set above)
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='nvim'

# editor / files
alias e="$EDITOR"
alias vim="$EDITOR"
alias view="$EDITOR -R"
alias v="view"
alias o='open'
alias c='bat'
alias b=bat
alias l=eza
alias ll='eza -l --group-directories-first'
alias ql='qlmanage -p'
alias hosts='sudo $EDITOR /etc/hosts'

# navigation
alias p='cd ~/Projects'
alias s='cd ~/Projects/SAFAB/machine/CODEBASE/src'

# ssh
alias myd='ssh myd'
alias hms='ssh hms01'

# git
alias lg=lazygit
unalias gm gd gb

# docker
alias d-c='docker compose'
alias dr='docker compose run'
alias de='docker compose exec'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias docker-prune='docker container prune && docker images prune && docker system prune'

# python / tools
alias py="python"
alias uvr='uv run'
alias f='uv run fab'
alias json_ppy='python -m json.tool'

# misc
alias xc='xed .'
alias clear-derived-data='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias j='jobs'
alias now='date +"%Y-%m-%d@%H-%M-%S"'
alias reload='. ~/.zshrc'

# https://github.com/dandavison/delta
function gd {
  if [ $(tput cols) -gt 150 ]; then
    git -c "core.pager=delta --side-by-side" diff "$@"
  else
    git diff "$@"
  fi
}

function gb {
  _fzf_git_each_ref --no-multi | xargs git checkout
}

rebuild() {
  docker compose stop $1
  docker compose build $1
  docker compose up $1
}

scp_rel() {
  local host=$1
  shift
  local r=/Users/automatfoto/SAFAB/automatfoto-git/CODEBASE/src
  for file in "$@"; do
    echo "$file"
    scp "$host:$r/$file" "$file"
  done
}

function secret {
  if [[ -z "$1" ]]; then
    echo "Usage: secret length"
    return 1
  fi

  if [[ "$1" == "chute" ]]; then
    python3 << 'EOF'
import random, string
chars = string.ascii_letters + string.digits
user = ''.join(random.choices(chars, k=16))
pass_ = ''.join(random.choices(chars, k=16))
print(f'{user}:{pass_}')
EOF
    return 0
  fi

  python3 -c "import random, string; print(''.join(random.choices(string.ascii_letters + string.digits, k=$1)))"
}

function vnc {
  if [[ -z "$1" ]]; then
    echo "Usage: vnc <user:password><host>"
    return 1
  fi
  open "vnc://$*"
}

pdfcompress () {
  # brew install ghostscript
  gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.3 \
    -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true \
    -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 \
    -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 \
    -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 \
    -sOutputFile="$1.compressed.pdf" "$1"
}

# Source .venv/bin/activate if it exists, on every cd and for the initial directory
function source_venv() {
  if [[ -f .venv/bin/activate ]]; then
    source .venv/bin/activate
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd source_venv
source_venv

# Tab on a SAF... prefix picks a SAFAB location with fzf, otherwise normal completion
_safab_complete() {
  local words=("${(z)LBUFFER}")
  local prefix="${words[-1]}"

  [[ "${prefix:u}" != SAF* ]] && return 1

  local results
  results=$(uv run ~/Projects/SAFAB/get_dashboard_locations.py --cred-path ./serviceAccountKey-safab.json 2>/dev/null \
    | grep -oE 'SAFAB[0-9]+: .+' \
    | while IFS=': ' read -r code name; do
        printf "%s\t%s\n" "$code" "$name"
      done)

  [[ -z "$results" ]] && return 1

  local filtered
  filtered=$(echo "$results" | grep -i "^${prefix}")
  [[ -z "$filtered" ]] && filtered="$results"

  local selected
  selected=$(echo "$filtered" \
    | fzf --height=40% --reverse --delimiter='\t' \
        --with-nth=1,2 \
        --preview-window=hidden \
        --prompt="SAFAB> " \
    | cut -f1 \
    | tr '[:upper:]' '[:lower:]')

  [[ -z "$selected" ]] && return 1

  # Remove the typed prefix and insert the selection
  LBUFFER="${LBUFFER[1,-${#prefix}-1]}${selected}"
  zle reset-prompt
}

_smart_tab() {
  local prefix="${LBUFFER##* }"
  if [[ "${prefix:u}" == SAF* ]]; then
    _safab_complete
  else
    zle expand-or-complete  # default tab behavior
  fi
}

zle -N _smart_tab
bindkey '^I' _smart_tab
