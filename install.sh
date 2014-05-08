#!/bin/bash

echo "go"

echo "delete old dotfiles"

#todo: Check files don't already exist
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.profile
rm ~/.bash_aliases

rm ~/.gitconfig
rm ~/.gitignore

rm ~/.screenrc

rm ~/.vimrc
rm -rf ~/.vim

echo "install vundle"
mkdir -p ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "linking dotfiles from current location"
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_profile ~/.bash_profile
ln -s $PWD/.profile ~/.profile
ln -s $PWD/.bash_aliases ~/.bash_aliases

ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore ~/.gitignore

ln -s $PWD/.screenrc ~/.screenrc

ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/bundles.vim ~/.vim/bundles.vim

echo "installing vundle packages"
vim -u $PWD/bundles.vim +PluginInstall +qall

echo "job's a good un..."