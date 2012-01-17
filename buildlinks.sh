#!/bin/bash

# symlinks source control versions of dotfiles to the places they should exist

cd
ln -s .dotfiles/.bash_aliases .bash_aliases
ln -s .dotfiles/.bashrc .bashrc
ln -s .dotfiles/.gitconfig .gitconfig
ln -s .dotfiles/.hgignore .hgignore
ln -s .dotfiles/.hgrc .hgrc
ln -s .dotfiles/.screenrc .screenrc
ln -s .dotfiles/.vimrc .vimrc
ln -s .dotfiles/vim .vim

# symlink full vim folder rather than individual color files
# cp .dotfiles/vim/colors/wombat.vim .vim/colors/wombat.vim
# cp .dotfiles/vim/colors/wombat256.vim .vim/colors/wombat256.vim
