Installation
============

    git clone git://github.com/scottwalsh/dotfiles.git

Install osx specific things:

    brew bundle Brewfile
    brew bundle Caskfile
    ./.osx

Install dotfiles:

    ./install.sh



Want to update to bash 4 on osx?

    brew install bash
    echo "/usr/local/bin/bash" >> /etc/shells
    chsh -s /usr/local/bin/bash
