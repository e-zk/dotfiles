#!/bin/ksh
# openbsd-specific config

# variables
#export PATH="$HOME/bin/bsd:$HOME/bin/vid:$HOME/bin/img:$HOME/bin/uni:$HOME/usr/go/bin:${PATH}"
export WALLPATH="$HOME/usr/img/walls"
export VISUAL=vise
export EDITOR=${VISUAL:-vi}
export MAILRC=${ETC}/mailrc
export MBOX=${HOME}/tmp/mbox

# chromium depot tools
#export PATH="${PATH}:${HOME}/usr/src/git/depot_tools"

# frig off, xdg
#export XDG_CONFIG_HOME=${ETC}
#export XDG_CACHE_HOME=${HOME}/var

# language stuff
#export PYTHONSTARTUP=${ETC}/pythonrc.py
#export GOPATH=${HOME}/usr/go
#export CABAL_DIR=${ETC}/cabal

# alias
alias aspell='aspell --home-dir=${ETC}/aspell'
alias ftop='top -C -g'
#alias img='ls -t | sxiv -iog 320x320'
alias imgurl='mpv --pause'
alias newt='urxvt'
alias netstart='doas sh /etc/netstart'
alias todo='${EDITOR} ~/usr/txt/todo.txt'
alias vise='TERM=xterm-256color vise'
alias xreload='xrdb -merge ~/etc/x/xresources'
alias cdblog='cd ~/usr/src/www/blog'

# autocomplete
set -A complete_rcctl -- get getdef set check reload restart stop start disable enable order ls
set -A complete_netstart -- $(ifconfig | grep ^[a-z] | cut -d: -f1)
set -A complete_bounce -- $(ifconfig | grep ^[a-z] | cut -d: -f1)

# bounce an interface
# usage: bounce <if>
bounce() {
	doas ifconfig $1 down
	sleep 1
	doas ifconfig $1 up
}

# list dependencies of given packge
# usage: deps <pkgname>
deps() {
	PKGNAME="$1"
	INFO="$(pkg_info -f "$PKGNAME")"
	echo "$INFO" | grep '^@depend' | cut -d ':' -f 3
	echo "$INFO" | grep '^@wantlib' | cut -d ' ' -f 2
}

# arm/disarm usbkill
arm() {
	touch /tmp/arm_usbkill && printf 'armed\n' || printf 'error arming\n'
}
disarm() {
	/bin/rm -f /tmp/arm_usbkill && printf 'disarmed\n' || printf 'error disarming\n'
}
