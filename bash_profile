local_config=~/.bash/`uname -n`
[[ -s $local_config ]] && source $local_config
source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/functions
source ~/.bash/config
source `brew --prefix`/etc/grc.bashrc

[[ -e $HOME/.rbenv ]] && eval "$(rbenv init -)"
eval "$(direnv hook bash)"
