# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# update definitons, upgrade already installed
update
upgrade

#todo: install brew-cask and cask programs?
#brew cask install caffeine dropbox iterm2 virtualbox vagrant the-unarchiver vlc google-chrome skype transmission

# Install GNU core utilities (those that come with OS X are outdated)
install coreutils       # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install findutils       # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed

install bash            # Install Bash 4

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
install ack
install curl
install git
install nmap
install p7zip
install foremost
install imagemagick --with-webp
install lynx
install ucspi-tcp # `tcpserver` et al.
install node
install pigz
install python
install python3
install pv
install redis
install rename
install rhino
install sqlmap
install sqlite
install tree
install webkit2png
install wget --enable-iri    # Install wget with IRI support
install xpdf
install zopfli

cleanup                # Remove outdated versions from the cellar