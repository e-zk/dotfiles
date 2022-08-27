#!/bin/sh
# /_ |_| |_\ /
#  / | | | \ \
# sh run command

# vi mode baby
set -o vi

# xdg dirs
export XDG_CONFIG_HOME="${HOME}/cfg"
export XDG_CACHE_HOME="${HOME}/var/cache"
export XDG_DATA_HOME="${HOME}/var/share"
export XDG_STATE_HOME="${HOME}/var/lib"
export XDG_RUNTIME_DIR="${HOME}/var/run"

# go dirs
export GOPATH="${HOME}/var/go"
export GOBIN="${GOPATH}/bin"

# path
export PATH="${HOME}/bin:${HOME}/bin/sym:${PATH}:${GOBIN}"

# editor
vispath="$(command -v vis)"
export EDITOR=${vispath:-vi}
export VISUAL=${vispath:-vi}

# use custom prompt command if availale
if command -v prompt >/dev/null; then
	# bash is special and need extra bs in the PS1
	# to work out that escape sequences are supposed to be 0 length
	# (ksh doesn't have this problem)
	if [ -n "$BASH_VERSION" ]; then
		export PS1='(\w) \$ '
	else
		eval $(prompt -s) >/dev/null
	fi
else
	export PS1='\$ '
fi

# dots management alias
alias dots='/usr/bin/git --git-dir=$HOME/var/dots/ --work-tree=$HOME'

# shortenings
alias f='finger'
alias h='history -r | less'
alias j='jobs -l'
alias p='ps'

# ls
alias ls='ls -F'
alias la='ls -AF'
alias ll='ls -AlFh'
alias l='ls -Fhl'

# interactive by default
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'

# OS specific configuration
if [ "$(id -u)" -ne "0" ]; then
	case "$(uname -s)" in
		OpenBSD)
			. "$XDG_CONFIG_HOME/sh/openbsd.sh"
		;;
		Linux)
			. "$XDG_CONFIG_HOME/sh/linux.sh"
			# load WSL2-specific settings
			if uname -r | grep 'WSL2$'; then
				. "$XDG_CONFIG_HOME/sh/wsl.sh"
			fi
		;;
	esac
fi

# make a dir and cd into it
mkcd() {
	if [ $# -lt 1 ]; then 
		echo "insufficient arguments given..."
		return 1
	fi

	local path=\$$#

	mkdir $@
	cd "$path"
}

# setup a tmux session for "development"
setupdev() {
	tmux new-session -d
	tmux split-window -v
	tmux new-window
	tmux previous-window
	tmux attach-session -d
}

# make a quick backup of a file 
# usage: bak <file>
bak() {
	cp -vr "$1" "${1}.bak"
}

# generate a quick filename (current date)
fname() {
	date '+%F-%H%M'
}
alias fn='fname'

# new blog post
#blog() {
#	title="${1:-title}"
#	date="$(date '+%F')"
#	vise "${HOME}/usr/txt/${date}-${title}.md"
#}

# shh...
#if [ $(id -u) -ne 0 ]; then
#	. ~/.secrets
#fi
