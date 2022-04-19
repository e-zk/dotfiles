#!/bin/sh
# linux-specific config

# variables
export GOPATH="${HOME}/var/go"
export PATH="${GOPATH}/bin:${HOME}/bin/wsl:${PATH}"
export VISUAL=vis
export EDITOR=${VISUAL:-vi}

# alias
alias editor=${EDITOR}
alias vim=${EDITOR}
alias ls='ls -F --color=auto'
