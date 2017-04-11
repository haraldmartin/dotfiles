# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="avit"
# ZSH_THEME="norm-hms"
ZSH_THEME="pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails rsync heroku rake bundler brew themes rbenv)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/martin/.rbenv/shims:/Users/martin/.rbenv/bin:/Users/martin/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/share/npm/bin/:"
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

eval "$(direnv hook zsh)"

alias e="$EDITOR"
alias v="view"
alias myd='ssh myd'
alias o='open'
alias reload='. ~/.zshrc'
alias pg.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias serve='python -m SimpleHTTPServer 8000'
alias transmit='open -a Transmit'
alias restart='touch tmp/restart.txt'
alias nr='npm run'
alias colordiff2='colordiff | diff-so-fancy | less -RFX'

# autoload -U promptinit; promptinit
# prompt pure

# function search {
#   find . -iname '*`echo $*`*'
# }

function xc {
  open "`ls -d *.xcworkspace *.xcodeproj | sort -r | head -1`"
}

function dropbox {
  p=$(pwd -P)
  [[ "$p" == *"$HOME/Dropbox"* ]] && open ${p/$HOME\/Dropbox/https:\/\/www.dropbox.com\/home}
}

export SHELL=/bin/zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(rbenv init -)"

function svtplay-dl-and-open {
  svtplay-dl $* | grep Outfile | awk '{ print $3 }' | xargs open -a VLC
}

function flash_cache {
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
}

alias xml_pp='xmllint --format -'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# . /Users/martin/torch/install/bin/torch-activate
export PATH="$HOME/.fastlane/bin:$PATH"
