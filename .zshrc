export ZSH=/Users/nnichols/.oh-my-zsh
ZSH_THEME=""
plugins=( git fzf )
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='nvim'
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias g="git status"
alias c="clear"
alias gcob='git checkout $(git branch | fzf)'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias z='vim ~/.zshrc && source ~/.zshrc'
alias v="vim ~/.vimrc"
alias t="vim ~/.tmux.conf"
alias b="vim ~/go/src/github.com/nqthqn/brain/.brain"
alias n="vim ~/code/csky/todo"
alias tplan="terraform plan"
alias tapply="terraform apply"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
# helpful functions
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
    pushd $f > /dev/null
    echo ""
    echo "$(basename ${f})"
    git --no-pager log --since=5.days --pretty="format:%cd: %s" \
	--author="Nathan Nichols" --date="format:%a %I:%M %p" \
	--reverse
    popd > /dev/null
    echo ""
  done
}

function branchy() {
  for b in $(git branch --format="%(refname)"); do 
    echo ${b}
    git rev-list --left-right --count master...${b}
  done;
}


function matrix() {
   echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}


# Node version management
#
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# pure
autoload -U promptinit; promptinit

PURE_CMD_MAX_EXEC_TIME=1000000000
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:path color white

prompt pure


export PATH=$PATH:/usr/local/mysql/bin
export PATH="/usr/local/sbin:$HOME/go/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
