Installation
    git clone git://github.com/nelstrom/dotfiles.git
    
Create symlinks:
    ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.gitignore ~/.gitignore
    ln -s ~/.dotfiles/.hgignore ~/.hgignore
    ln -s ~/.dotfiles/.hgrc ~/.hgrc
    ln -s ~/.dotfiles/.screenrc ~/.screenrc
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/vim ~/.vim

VIM
===

Add a plugin
    git submodule add http://github.com/tpope/vim-fugitive.git vim/bundle/fugitive
    git add .
    git commit -m 'Install plugin'
    
Update a plugin
    cd ~/.vim/bundle/fugitive
    git pull origin master
    
Update all plugins
    git submodule foreach git pull origin master
