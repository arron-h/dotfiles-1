#!/bin/bash

# symlinks source control versions of dotfiles to the places they should exist

cd
ln -s .dotfiles/.bash_aliases .bash_aliases
ln -s .dotfiles/.bash_rc .bash_rc
ln -s .dotfiles/.gitconfig .gitconfig
ln -s .dotfiles/.hgignore .hgignore
ln -s .dotfiles/.hgrc .hgrc
ln -s .dotfiles/vim/.vimrc .vimrc

cp .dotfiles/vim/colors/wombat.vim .vim/colors/wombat.vim
cp .dotfiles/vim/colors/wombat256.vim .vim/colors/wombat256.vim
