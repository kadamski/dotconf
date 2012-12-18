#!/bin/sh
cd `dirname $0`

DOTFILES='screenrc vimrc vim'

for F in ${DOTFILES}; do
    if [ ! -f ${HOME}/.${F} ]; then
        ln -s ${PWD}/${F} ${HOME}/.${F}
    fi
done

git submodule init
git submodule update
# git submodule foreach git pull origin master
