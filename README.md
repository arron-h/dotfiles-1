Installation
============

TODO: Create install.sh
TODO: Create Brewfile

    brew install bash
    
Add /usr/local/bin/bash to /etc/shells

    chsh -s /usr/local/bin/bash.

brew install bash-completion

Fetch:

    cd ~
    git clone git://github.com/scottwalsh/dotfiles.git
    
Create symlinks:

TODO: Check files don't already exist

    ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/.bashrc ~/.bashrc
    ln -s ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/dotfiles/.profile ~/.profile
    ln -s ~/dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/.gitignore ~/.gitignore
    ln -s ~/dotfiles/.screenrc ~/.screenrc
    ln -s ~/dotfiles/.vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    
VIM
---

    echo "install vundle"
    mkdir -p ~/.vim/bundle/vundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    echo "installing vundle packages"
    vim -u ~/.vim/bundles.vim +BundleInstall +qall
