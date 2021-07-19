#!/bin/bash

echo "BASHRC has run"

set -o vi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\[\e[00;33m\]\u\[\e[0m\]\[\e[00;37m\]@\h:\[\e[0m\]\[\e[00;36m\][\w]:\[\e[0m\]\[\e[00;       37m\]\[\e[0m\]\$(parse_git_branch)"

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTIGNORE='ls:bg:fg:history:cd'
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
export HISTTIMEFORMAT="%F %T "           # timestamp history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#Save only - don't reload
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#set window title to hostname
echo -ne "\033]2;`hostname`\007"

#export PATH=$PWD/bin:$PATH

alias hg="history | grep"

alias python='python3'

#export GOROOT=/usr/local/go
#export GOPATH=/Users/mrosmarin1/go
#export GOBIN=/Users/mrosmarin1/go/bin
#export SSL_CERT_FILE=~/bb-cert/BBRootNEW.pem
#export PATH=$PATH:$GOBIN
