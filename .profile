#!/bin/bash

#tmux
EVENT_NOKQUEUE=1
alias tm='tmux attach || tmux new' #Because having multiple sessions is fiddly
#SSH
alias rpi='ssh rpi' # see ~/.ssh/config
#Aliases
alias ping8="ping 8.8.8.8" #Actually test the inet connection
alias yecto="ssh yecto@backtick.town"
alias adom="ssh yecto@backtick.town -t \"~/bin/adom\""
alias git="hub"
alias nano="micro"
alias ad="git add ."
alias ph="git push"
function cm { git commit -m "$1"; }
#Micro
EDITOR="micro"
MICRO_TRUECOLOR=1

export PATH=$PATH:$HOME/bin #Add my personal bin

#Custom Prompts
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="git name"

isssh(){
if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\)$ ]] ; then
echo -ne "$(whoami) ";
fi
}

isroot(){
if [ "$(whoami)" = "root" ] ; then
echo -ne "root "
fi
}

isgit(){
if git rev-parse --git-dir > /dev/null 2>&1; then
  echo -ne " on\033[38;2;0;170;255m$(__git_ps1 '')";
fi
}

PS1="\[$(tput bold)\033[38;2;255;0;255m\]\u\[$(tput sgr0)\] at \[\033[38;2;0;130;255m\]\h\[$(tput sgr0)\] in \[$(tput setaf 2)\]\w\[$(tput sgr0)\]\$(isgit)\[$(tput sgr0)\]\n\[$(tput bold)\]\$\[$(tput sgr0)\] " 
#2tiny
PS2="\[\033[1A\]\[$(echo -n ╟)\]\[\033[1B\033[2D\]╙\[$(tput setaf 4; tput bold)\]->\[$(tput sgr0)\] " #2tiny Smart PS2
#PS1="\[$(tput setaf 7; tput bold)\]\W>\[$(tput sgr0)\] " #Apple
