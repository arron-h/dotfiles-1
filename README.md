Installation
============

    brew install bash
Add /usr/local/bin/bash to /etc/shells
    chsh -s /usr/local/bin/bash.

brew install bash-completion

Fetch:

    cd ~
    git clone git://github.com/scottwalsh/dotfiles.git
    
Create symlinks:

    ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/.bashrc ~/.bashrc
    ln -s ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/dotfiles/.profile ~/.profile
    ln -s ~/dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/.gitignore ~/.gitignore
    ln -s ~/dotfiles/.hgignore ~/.hgignore
    ln -s ~/dotfiles/.hgrc ~/.hgrc
    ln -s ~/dotfiles/.screenrc ~/.screenrc
    ln -s ~/dotfiles/.vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    
Switch to the '~/.vim' directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

VIM
---

Add a plugin

    git submodule add http://github.com/tpope/vim-fugitive.git vim/bundle/fugitive
    git add .
    git commit -m 'Install plugin'
    
Update a plugin

    cd ~/.vim/bundle/fugitive
    git pull origin master
    
Update all plugins

    git submodule foreach git pull origin master
