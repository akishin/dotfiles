#!/bin/bash

DOT_FILES=( .zshrc .gitconfig .irbrc .pryrc .screenrc .vimrc .gvimrc .tmux.conf .vim/ftplugin/ruby.vim )

for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ] ; then
        ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done

# $B%m!<%+%kMQ(B .zshrc $B$N6u%U%!%$%k:n@.$7$H$/(B
if [ ! -e $HOME/.zshrc.local ] ; then
    touch $HOME/.zshrc.local
fi
