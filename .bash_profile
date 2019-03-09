# Shorthand
alias ..="cd .."
alias l="ls -1"
alias g="git status"
alias gco="git checkout"
alias c="clear"
alias bs="vim ~/.bash_profile && source ~/.bash_profile"
alias vim="nvim"
alias vi="nvim"
alias sed="gsed"

# Enviornmanet variables
export GOBIN="/Users/nnichols/go/bin"

# Encourage bad behavior...
alias gallup="git add . && git commit && git push"

# Fuzzy Search
test -f ~/.fzf.bash && . $_

# Jump around — Tracks your most used directories, based on 'frecency'.
source ~/.bin/z.sh

####### Since we are using z and fzf, share bash histories
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#######

# Git completion
test -f ~/git-completion.bash && . $_

export PATH="/usr/local/opt/ncurses/bin:$PATH:$GOBIN"
#
# Clean and minimalistic Bash prompt
# Author: Artem Sapegin, sapegin.me
# 
# Inspired by: https://github.com/sindresorhus/pure & https://github.com/dreadatour/dotfiles/blob/master/.bash_profile
#
# Notes:
# - $local_username - username you don’t want to see in the prompt - can be defined in ~/.bashlocal : `local_username="admin"`
# - Colors ($RED, $GREEN) - defined in ../tilde/bash_profile.bash
#
if [ -z "$PS1" ]; then
  return
fi

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################

bash_prompt_command() {
  RETURN=$?
  # How many characters of the $PWD should be kept
  local pwdmaxlen=45
  # Indicate that there has been dir truncation
  local trunc_symbol=".."
  local dir=${PWD##*/}
  pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
  NEW_PWD=${PWD/#$HOME/\~}
  local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
  if [ ${pwdoffset} -gt "0" ]
  then
    NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
    NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
  fi
  history -a
  #EXIT_CODE='$(if [[ $RETURN = 0 ]]; then echo -ne ""; else echo -ne "\[$EMR\]$RETURN\[$NONE\] "; fi;)'
}

PROMPT_VCS=1 # version control system name, branch and dirty status

prompt.vcs.enable(){
  PROMPT_VCS=1
}
prompt.vcs.disable(){
  PROMPT_VCS=0
}
vcs(){
  [ $PROMPT_VCS -eq "1" ] && echo -e $(vcprompt -f "${K} %n[${R}%b${EMG}%m${EMR}%u${K}]")
}

bash_prompt() {
  case $TERM in
    xterm*|rxvt*)
      local TITLEBAR='\[\033]0;${SHORT_HOST} ${NEW_PWD}\007\]'
      ;;
    *)
    local TITLEBAR=""
    ;;
  esac

  local UC=$W                    # user's color
  [ $UID -eq 0 ] && UC=$EMR      # root's color

  local ARROW_COLOR=$EMR
  [ $? -eq 0 ] && ARROW_COLOR=$EMG

  PS1="\[${TITLEBAR}\
${UC}\u\
\$(vcs) \
${EMB}\${NEW_PWD} \
${K} \
\[${NONE}\]\n\[${ARROW_COLOR}\]→ \[${NONE}\]"

}

PROMPT_COMMAND=bash_prompt_command
bash_prompt

# Trigger ~/.bashrc commands
. ~/.bashrc
export CLICOLOR=1
export PATH="$HOME/.bin:/usr/local/opt/nss/bin:$PATH"
