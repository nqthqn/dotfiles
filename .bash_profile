# Shorthand
alias ..="cd .."
alias l="ls -1"
alias vim="nvim"
# Git aliases
alias g="git status"
alias gco='git checkout $(git branch | fzf)'
alias gallup="git add . && git commit && git push -u origin HEAD"

alias c="clear"
alias bs="vim ~/.bash_profile && source ~/.bash_profile"
alias sed="gsed"
alias t="tmux select-pane -T"
alias gl="git log1"
alias penv="virtualenv .env && source .env/bin/activate && pip install -r requirements.txt"
alias simplename="for file in *; do mv "$file" $(echo $file | tr ' ' '-' | tr 'A-Z' 'a-z') ; done"
alias p="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

# dev
alias svgclean="pbpaste | node svgclean.js $1 | pbcopy"

# Terraform
alias tinit="terraform init"
alias tapply="terraform apply"
alias tplan="terraform plan"
alias tstate="terraform state"

# Tmux
alias engi="tmux new-session \"tmux source-file ~/.eng\""

alias fly="fly -t tutorial"

HISTTIMEFORMAT='(%d/%m/%y %T) '

function dlogin() {
    echo "Performing docker login to account ${1}"
    aws ecr get-login --no-include-email --profile $1 | bash
}

function sql2jira() {
    pbpaste | tr '\t' '|' | sed 's/^/|/' | sed 's/$/|/' | pbcopy
}

function hours() {
    for f in /Users/nnichols/code/csky/*; do
        [[ ! -d $f/.git ]] && echo "" && continue
        pushd $f >/dev/null
        echo ""
        echo "$(basename ${f})"
        git --no-pager log --since=5.days --pretty="format:%cd: %s" \
            --author="Nathan Nichols" --date="format:%a %I:%M %p" \
            --reverse
        popd >/dev/null
        echo ""
    done
}

function branchy() {
    for b in $(git branch --format="%(refname)"); do
        echo ${b}
        git rev-list --left-right --count master...${b}
    done
}

function matrix() {
    echo -e "\e[1;40m"
    clear
    while :; do
        echo $LINES $COLUMNS $(($RANDOM % $COLUMNS)) $(($RANDOM % 72))
        sleep 0.05
    done | awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}

_node_version() {
    local br
    br=$(node -v)
    test -n "$br" && printf %s "$br" || :
}

# Enviornmanet variables
export GOBIN="/Users/nnichols/go/bin"

# Fuzzy Search
# test -f ~/.fzf.bash && . $_

# Jump around — Tracks your most used directories, based on 'frecency'.
source ~/.bin/z.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Trigger ~/.bashrc commands
. ~/.bashrc
export CLICOLOR=1

# Path
export PATH="$HOME/.rbenv/shims:/usr/local/opt/ncurses/bin:$PATH:$GOBIN"
export PATH="$HOME/.bin:/usr/local/opt/nss/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@3.6/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@4.0/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

export EDITOR='vim'

export BASH_SILENCE_DEPRECATION_WARNING=1
