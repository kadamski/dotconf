#!/bin/sh
cd `dirname $0`

DOTFILES='screenrc vimrc vim tmux.conf bashrc i3status.conf i3/config zshrc gitconfig vimperatorrc zellij'
DOTCONFIGFILES='liquidpromptrc sway nvim swayidle foot'

for F in ${DOTFILES}; do
    if [ ! -e ${HOME}/.${F} ]; then
        mkdir -p `dirname ${HOME}/.${F}`
        ln -s ${PWD}/${F} ${HOME}/.${F}
    fi
done

for F in ${DOTCONFIGFILES}; do
    if [ ! -e ${HOME}/.config/${F} ]; then
        ln -sf ${HOME}/dotconf/${F} ${HOME}/.config/${F}
    fi
done

git submodule init
git submodule update
# git submodule foreach git pull origin master
if [ ! -e ${HOME}/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +BundleInstall +qall
