#!/bin/bash

# This is the portable version of my profile, I use a different one one my Mac

#tmux
alias tm='tmux attach || tmux new' #Because having multiple sessions is fiddly
#Aliases
alias ping8="ping 8.8.8.8" #Actually test the inet connection
alias git="hub"
alias nano="micro"
alias ff="/Applications/Firefox.app/Contents/MacOS/firefox"
alias ad="git add ."
alias ph="git push"
function cm { git commit -m "$1"; }
alias updatewebsite="ssh macserver -t 'UW_PWD=\"$(pwd)\";cd ~/hiccup01-next;git pull;cd \"$UW_PWD\";';"
alias lc="colorls"
#Micro
EDITOR="micro"

export PATH=$PATH:$HOME/bin #Add my personal bin

function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }
#open -a AnyBar #If you run this when you source this it takes the terminal out of focus
#/Applications/AnyBar.app/Contents/MacOS/Anybar

#Custom Prompts
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

#username() {
#if [!$(whoami)=DEFUALTUSER] then echo -n "\w";
#}

isssh(){
if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\)$ ]] ; then
echo -ne "$(whoami) ";
fi
}

hostnameis(){
if [ !"$(hostname)" = "The-Tardis.local" ] ; then
echo -ne "$(hostname) "
fi
}

isroot(){
if [ "$(whoami)" = "root" ] ; then
echo -ne "root "
fi
}

PS1="╓ \[$(tput setaf 1; tput bold)\]$(isroot)\[$(tput sgr0)\]\[$(tput setaf 5; tput bold)\]$(isssh)\[$(tput sgr0)\]\[$(tput setaf 2; tput bold)\]\w\[$(tput sgr0)\]\$(__git_ps1)\n╙\[$(tput setaf 4; tput bold)\]~>\[$(tput sgr0)\] " 
#2tiny
PS2="\[\033[1A\]\[$(echo -n ╟)\]\[\033[1B\033[2D\]╙\[$(tput setaf 4; tput bold)\]->\[$(tput sgr0)\] " #2tiny Smart PS2
#PS1="\[$(tput setaf 7; tput bold)\]\W>\[$(tput sgr0)\] " #Apple
