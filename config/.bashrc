#!/bin/bash

echo "BASHRC has run"

set -o vi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[00;33m\]\u\[\e[0m\]\[\e[00;37m\]@\h:\[\e[0m\]\[\e[00;36m\][\w]:\[\e[0m\]\[\e[00;       37m\]\[\e[0m\]\$(parse_git_branch)"

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

export PATH=$PWD/bin:~/workspace/depot_tools:$PATH:~/workspace/chromium/.gclient:$PNPM_HOME:$PYENV_ROOT/bin:$PATH:/opt/homebrew/bin/

alias hg="history | grep"

alias python='python3'
alias pull='git pull origin main'
alias appsup='cd ~/Library/Application\ Support'
alias res='~/workspace/browser-swift-test-data/Sources/ImportData/Resources/'
alias derived='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias js='cd ~/workspace/arc/Frameworks/ARC/Sources/SelectorGeneration/Javascript'

lias pip='pip3'


cd workspace/arc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: /opt/homebrew/Cellar/graphite/64/bin/gt completion >> ~/.bashrc
#    or /opt/homebrew/Cellar/graphite/64/bin/gt completion >> ~/.bash_profile on OSX.
#
_gt_yargs_completions()
{
    local cur_word args type_list

    cur_word="${COMP_WORDS[COMP_CWORD]}"
    args=("${COMP_WORDS[@]}")

    # ask yargs to generate completions.
    type_list=$(/opt/homebrew/Cellar/graphite/64/bin/gt --get-yargs-completions "${args[@]}")

    COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )

    # if no match was found, fall back to filename completion
    if [ ${#COMPREPLY[@]} -eq 0 ]; then
      COMPREPLY=()
    fi

    return 0
}
complete -o bashdefault -o default -F _gt_yargs_completions gt
###-end-gt-completions-###


clear_last_command() {
    local lines_to_clear=$(history 1 | awk '{print $1}')
    if [ $lines_to_clear -gt 0 ]; then
        local current_line=$(tput lines)
        tput cuu $lines_to_clear
        tput ed
        tput cup $((current_line - lines_to_clear)) 0
    fi
}

clear_last_command() {
    local last_command=$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//")
    local lines_to_clear=$(eval "$last_command" | wc -l)
    if [ $lines_to_clear -gt 0 ]; then
        tput cuu $lines_to_clear
        tput ed
    fi
    history -d $(history 1)
}

# pnpm
export PNPM_HOME="/Users/maya/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(/opt/homebrew/bin/pyenv init -)"

lias swiftpm='rm -rf ~/Library/Caches/org.swift.swiftpm'

alias ops='python -m venv .venv; source .venv/bin/activate; pip install -r requirements.txt'
