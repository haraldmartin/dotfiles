source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/functions
source ~/.bash/config

[[ -f ~/.bashrc ]] && source ~/.bashrc
# -- start rip config -- #
RIPDIR=/Users/martin/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #