# Install homebrew (will also download xcode command line tools)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install GUI apps
brew install --cask google-chrome clipy slack skype vlc zoomus iterm2 transmission protonvpn rectangle firefox kap homebrew/cask-versions/docker-edge

# Install CLI apps
brew install tmux nvim fzf node bat fd

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Use pure prompt
npm install --global pure-prompt

# use iosevka font
brew tap homebrew/cask-fonts && brew install --cask font-iosevka font-iosevka-slab
