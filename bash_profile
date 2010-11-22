source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/functions
source ~/.bash/config
local_config=~/.bash/`uname -n`
[[ -s $local_config ]] && source $local_config
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -s ~/.bashrc ]] && source ~/.bashrc
