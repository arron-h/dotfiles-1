# homebrew packages
# usage: `brew bundle Brewfile`

# update definitons, upgrade already installed
update
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
install coreutils       # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install findutils       # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed

install bash            # Install Bash 4
install macvim --override-system-vim
install homebrew/dupes/grep

# Install other useful binaries
install ack
install curl
install git
install nmap
install imagemagick --with-webp
install lynx
install node
install python
install python3
install redis
install sqlite
install webkit2png
install xpdf

cleanup                # Remove outdated versions from the cellar