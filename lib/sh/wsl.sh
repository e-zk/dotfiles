#!/bin/sh
# wsl config

# variables
export WHOME="/mnt/c/Users/ZZZ"
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${HOME}/bin/wsl:${PATH}"
export VISUAL=vis
export EDITOR=${VISUAL:-vi}

# alias
alias vim=vis
alias 230='cd "${WHOME}/_Uni/CAB230"'
alias docs='cd "${WHOME}/Documents"'
alias ls='ls -F --color=auto'

# 
#if [ -n "$BASH_VERSION" ] && [ -z "$KSH_VERSION" ]; then
#	export PS1="\W\$ "
#fi

# make new react app
mkreact() {
	if [ -z $1 ]; then
		echo "usage: $0 <app-title>"
		return 1
	fi
	
	npx create-react-app $@
}
