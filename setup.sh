#!/bin/bash

DOT_FILES=( .zshrc .gitconfig .irbrc .pryrc .screenrc .vimrc .gvimrc .tmux.conf .vim/ftplugin/ruby.vim )

for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ] ; then
        ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done

# ローカル用 .zshrc の空ファイル作成しとく
if [ ! -e $HOME/.zshrc.local ] ; then
    touch $HOME/.zshrc.local
fi
