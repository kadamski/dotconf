
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ x"`which vimx 2>&1`" != x'' ]; then
    export EDITOR=vimx
    alias vim=vimx
    alias vimx='vimx --servername default'
    alias v='vimx --remote-tab-silent'
else
    export EDITOR=vim
fi

# ctrl-<left> ctrl-<right>
bind '"\eOC":forward-word'
bind '"\eOD":backward-word'

export TERM=${TERM%%-256color}-256color
export PATH=~/bin/:$PATH

unset PROMPT_COMMAND

#source ~/dotconf/base16-default.dark.sh

# pyenv
if [ -n "$(which pyenv)" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
HISTFILESIZE=10000
