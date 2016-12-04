#!/bin/bash


#tmux
alias tm='tmux attach -c "screenfetch"|| tmux new -c "screenfetch"' #Because having multiple sessions is fiddly
#SSH
alias rpi='ssh rpi' # see ~/.ssh/config
alias rpix="xterm -e 'ssh rpi -Y lxsession'" # Start xterm (in XQuartz) and ssh into my pi and run lxde
#Aliases
alias ping8="ping 8.8.8.8" #Actually test the inet connection
alias yecto="ssh yecto@backtick.town"
alias adom="ssh yecto@backtick.town -t \"~/bin/adom\""
alias egg="screen /dev/tty.usbserial-DN01AGAT 115200"
EDITOR="nano"
export PATH=$PATH:$HOME/bin

function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }
open -a AnyBar

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

PS1="╓ \[$(tput setaf 5; tput bold)\]$(isssh)\[$(tput sgr0)\]\[$(tput setaf 2; tput bold)\]\w\[$(tput sgr0)\]\$(__git_ps1)\n╙\[$(tput setaf 4; tput bold)\]~>\[$(tput sgr0)\] " #2tiny
PS2="\[\033[1A\]\[$(echo -n ╟)\]\[\033[1B\033[2D\]╙\[$(tput setaf 4; tput bold)\]->\[$(tput sgr0)\] " #2tiny Smart PS2
#PS1="\[$(tput setaf 0; tput bold)\]\W>\[$(tput sgr0)\] " #Apple
