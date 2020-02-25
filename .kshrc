#!/bin/ksh
# ~/.kshrc : ksh initialisation

# vi mode baby
set -o vi

# variables
export PATH="$PATH:$HOME/bin/vid:$HOME/bin/img:$HOME/bin/uni"
export GOPATH="$HOME/usr/go"
export WALLPATH="$HOME/usr/img"
export PS1="\W\$ "
export TMPDIR=/tmp
export VISUAL=vim
export EDITOR=${VISUAL:-vi}

# alias
alias \!\!='history | tail -1 | cut -f 2'
alias f='finger'
alias h='history -r | less'
alias j='jobs -l'
alias la='ls -a'
alias l='ls -Fhl'
alias ll='ls -AFhl'
alias mv='mv -i'
alias rm='rm -i'
alias todo='vim $HOME/usr/txt/todo.txt'
#alias upload='doas teensyloader --mcu=atmega32u4 -v -w'
alias xreload='xrdb -merge ~/.Xdefaults'
alias yt='mpv --profile youtube'


# setup a tmux session for development
setupdev() {
	tmux new-session -d
	tmux split-window -v
	tmux new-window
	tmux previous-window
	tmux attach-session -d
}

# oopsie
dosa() {
	echo "yum!"
	doas "$@"
}

# make a quick backup of a file 
# usage: bak <file>
bak() {
	cp -vr "$1" "${1}.bak"
}

# generate a quick filename (current date)
fname() {
	echo "`date '+%b.%d-%H%M'`"
}

# make a dir and cd into it
mkcd() {
	if [ $# -eq 1 ]; then 
		eval local path=\$$#
	else
		echo "insufficient arguments given..."
		return 1
	fi
	mkdir -p $@
	cd "$path"
}

# reload bar
barreload() {
	pkill lemonbar
	stacks clock &
	stacks date  &
	stacks bat   &
	stacks wttr  &
}

# bounce an interface
# usage: bounce <if>
bounce() {
	doas ifconfig $1 down
	doas ifconfig $1 up
}

# shh...
. ~/.secrets
