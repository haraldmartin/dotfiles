local_config=~/.bash/`uname -n`
[[ -s $local_config ]] && source $local_config
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/functions
source ~/.bash/paths
source ~/.bash/config
source `brew --prefix grc`/etc/grc.bashrc

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
# [[ -s ~/.bashrc ]] && source ~/.bashrc
