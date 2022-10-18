export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="avit"
# ZSH_THEME="norm-hms"
ZSH_THEME="refined"
# ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git rails rsync heroku rake bundler brew themes rbenv)
plugins=(
  git 
  rails ruby 
  rsync 
  heroku 
  brew 
  themes 
  iterm2 
  zsh-autosuggestions
  zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh

# autoload -U promptinit; promptinit
# prompt refined

# color=[38;5;23m]
# export PROMPT="%F{color%(1j. %j .)$PROMPT"

# show bg jobs in prompt
export PROMPT="%(1j. %j .)$PROMPT"
# eval "$(starship init zsh)"

# User configuration

export PATH="/Users/martin/.rbenv/shims:/Users/martin/.rbenv/bin:/Users/martin/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/share/npm/bin/:"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:/usr/local/Cellar/gettext/0.20.1/bin

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
alias vim="/usr/local/bin/vim"
export EDITOR='vim'

alias e="$EDITOR"
alias v="view"
alias o='open'
alias l=exa
alias b=bat

alias myd='ssh myd'
alias reload='. ~/.zshrc'

alias pg_ctl@14='/usr/local/opt/postgresql@14/bin/pg_ctl'
alias pg_ctl-local='pg_ctl@14 -D /usr/local/var/postgres-local -l /usr/local/var/postgres/server.log start'
alias pg.start='pg_ctl@14 -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg.stop='pg_ctl@14 -D /usr/local/var/postgres stop -s -m fast'

# export BAT_THEME=ansi
export BAT_STYLE=plain

alias serve='python -m SimpleHTTPServer 8000'
alias r='bin/rails'
alias transmit='open -a Transmit'

# GIT
alias gs='git status'

# https://github.com/dandavison/delta
unalias gd
function gd {
  if [ $(tput cols) -gt 150 ]; then
    git -c "core.pager=delta --side-by-side" diff $*
  else
    git diff $*
  fi
}
unalias gb

function gb {
  git switch $(git branch | fzf)
}

alias nr='npm run'
alias now='date +"%Y-%m-%d@%H-%M-%S"'

# docker
alias d-c='docker compose'
alias dr='docker compose run'
alias de='docker compose exec'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias docker-prune='docker container prune && docker images prune && docker system prune'
rebuild() {
  docker compose stop $1
  docker compose build $1
  docker compose up $1
}


# django
m() { PYTHONIOENCODING=utf8 fab manage:"$*" }
mt() { m test,"--failfast,--keepdb,--debug-mode,--noinput,$*" }

alias ml='scripts/manage_local.sh'
mtl() { ml test --failfast --keepdb --debug-mode --noinput $* }

alias ms='fab server'
alias mc='m shell_plus --print-sql'

# work
alias ae='pyenv activate allears && cd ~/Projects/AllEars/allears'
alias isort='isort --profile black'


alias j='jobs'
alias f='fg %-'
alias hosts='sudo $EDITOR /etc/hosts'
alias json_ppy='python -m json.tool'

alias xml_pp='xmllint --format -'

export SHELL=/bin/zsh

if [[ -e '/opt/homebrew' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
fi


# Python + pyenv
if command -v pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1

  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if command -v rbenv > /dev/null; then
  eval "$(rbenv init - zsh)"
fi

eval "$(direnv hook zsh)"


# export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"
# export PATH="$HOME/Library/Python/2.7/bin:$PATH"
# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# Must be last
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/opt/homebrew/opt/openssl@1.0/bin:$PATH"
