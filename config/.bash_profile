#!/bin/bash

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\[\033[1;36m\]\u@\h \w -\$(parse_git_branch) $ "

#export PS1="\[\033[1;35m\]\u@\h \w -\$(parse_git_branch) $ "
#echo -e "\e[31mHello World\e[0m"
#export PS1="\u@\h: \w \$ \$(parse_git_branch) "

export BASH_SILENCE_DEPRECATION_WARNING=1
source ~/.bashrc

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[00;33m\]\u\[\e[0m\]\[\e[00;37m\]@\h:\[\e[0m\]\[\e[00;36m\][\w]:\[\e[0m\]\[\e[00;       37m\]\[\e[0m\]\$(parse_git_branch)"

alias rm="trash"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
