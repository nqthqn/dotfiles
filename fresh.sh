# Install homebrew (will also download xcode command line tools)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install GUI apps
brew install --cask clipy zoomus iterm2 protonvpn rectangle firefox

# Install CLI apps
brew install tmux fzf node

# Use pure prompt
npm install --global pure-prompt

# use iosevka font
brew tap homebrew/cask-fonts && brew install --cask font-iosevka font-iosevka-slab
