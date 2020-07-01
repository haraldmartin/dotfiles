# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="avit"
# ZSH_THEME="norm-hms"
ZSH_THEME="refined"
# ZSH_THEME="spaceship"

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
COMPLETION_WAITING_DOTS="true"

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
# plugins=(git rails rsync heroku rake bundler brew themes rbenv)
plugins=(git rsync heroku rake bundler brew themes rbenv pyenv iterm2 zsh-autosuggestions)


source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
# prompt refined

# color=[38;5;23m]
# export PROMPT="%F{color%(1j. %j .)$PROMPT"

# show bg jobs in prompt
export PROMPT="%(1j. %j .)$PROMPT"

# User configuration

export PATH="/Users/martin/.rbenv/shims:/Users/martin/.rbenv/bin:/Users/martin/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/share/npm/bin/:"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:/usr/local/Cellar/gettext/0.20.1/bin
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

export LC_ALL=en_US.UTF-8

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
alias vim="/usr/local/bin/vim"
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

eval "$(direnv hook zsh)"

alias e="$EDITOR"
alias v="view"
alias o='open'

alias myd='ssh myd'
alias reload='. ~/.zshrc'

alias pg.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias serve='python -m SimpleHTTPServer 8000'
alias transmit='open -a Transmit'
# alias restart='touch tmp/restart.txt'

alias nr='npm run'
alias colordiff2='colordiff | diff-so-fancy | less -RFX'
alias now='date +"%Y-%m-%d@%H-%M-%S"'

# docker
alias d-c='docker-compose'
alias dr='docker-compose run'
alias de='docker-compose exec'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias docker-prune='docker container prune && docker images prune && docker system prune'

# python & django
alias f='fab -R'

m() { fab manage:$* }
alias mc='m shell_plus'
alias ms='fab server'

alias j='jobs'
alias hosts='sudo $EDITOR /etc/hosts'
alias json_ppy='python -m json.tool'
alias search='find . -iname'

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

function flash_cache {
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
}

alias xml_pp='xmllint --format -'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
