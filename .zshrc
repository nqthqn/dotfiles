export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/Users/nnichols/.oh-my-zsh
ZSH_THEME="avit"
plugins=( git fzf )
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='nvim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
alias g="git status"
alias c="clear"
alias gcob='git checkout $(git branch | fzf)'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias z='vim ~/.zshrc && source ~/.zshrc'
alias v="vim ~/.vimrc"

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

# pure
autoload -U promptinit; promptinit
prompt pure
