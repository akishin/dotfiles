#!/bin/bash

DOT_FILES=( .zshrc .gitconfig .inputrc .gemrc .irbrc .pryrc .screenrc .vimrc .gvimrc .vimshrc .tmux.conf .vim/ftplugin/ruby.vim .percol.d .peco .bundle .ctags)

# .vim ディレクトリが存在しなければ作成
if [ ! -d $HOME/.vim/ftplugin ] ; then
    mkdir -p $HOME/.vim/ftplugin
fi

# .config/nvim ディレクトリが存在しなければ作成
if [ ! -d $HOME/.config/nvim ] ; then
    mkdir -p $HOME/.config/nvim
fi

# init.vim
if [ ! -e $HOME/.config/nvim/init.vim ] ; then
    ln -s $HOME/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
fi

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

# ローカル用 .vimrc の空ファイル作成しとく
if [ ! -e $HOME/.vimrc.local ] ; then
    touch $HOME/.vimrc.local
fi

# Vim のバックアップファイル用ディレクトリが存在しなければ作成
if [ ! -d $HOME/tmp ] ; then
    mkdir $HOME/tmp
fi
