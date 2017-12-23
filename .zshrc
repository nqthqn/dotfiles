# enviornment variables
export ZSH=/Users/nathann/.oh-my-zsh
export ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

export ANDROID_HOME=~/Library/Android/sdk
export GOPATH=$HOME/work
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export EDITOR="vim"
export GHOST_NODE_VERSION_CHECK=false

# Aliases
alias z='vim ~/.zshrc && source ~/.zshrc'
alias gobae="go build -ldflags -s -v -i -o builds/\$(basename \${PWD}) && builds/\$(basename \${PWD})" #$() command expansion
alias hosts="sudo vim /etc/hosts && sudo killall -HUP mDNSResponder"
alias big="for i in G M K; do du -ah | grep [0-9]$i | sort -nr -k 1; done | head -n 11"
alias c="clear"
alias pre="hub pull-request"
alias love="/Applications/love.app/Contents/MacOS/love"
alias luma="cd /Users/nathann/code/luma/www"
alias l="ls -lh"

# git
alias g="git status"
alias gc="git add . && git commit -m"
alias gm="git commit -m"
alias gd="git diff"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# tmux aliases
alias t="tmux attach -t 0"
alias olga="ssh root@198.199.101.121"
alias v="vim ~/.vimrc"
alias sed="gsed"
alias ecrac="pb2elm ~/work/src/gitlab.com/lumastudio/craconidl/cracon.proto"
alias t="tmux attach -t"
alias tl="tmux ls"
alias m="sh ~/bin/matrix.sh"

eval $(thefuck --alias)

plugins=(git sublime)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
