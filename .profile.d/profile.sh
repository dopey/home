#!/bin/sh

# =============================================================================
# Bash Prompt
# =============================================================================

. $HOME/.profile.d/colors.sh
. $HOME/.profile.d/git-prompt.sh

if [[ "${OSTYPE}" == "darwin"* ]]; then
    POINTER_CHAR="⬆"
    PREINFO="\n$POINTER_CHAR $BIBLUE[ "$BLUE"exit: $WHITE\$?$BIBLUE ] [ "$BLUE"time: $WHITE\t$BIBLUE ]$END_COLOR"
    PREGIT="$PREINFO\n$WHITE\u $PURPLE@ $BLUE\h$WHITE \w$END_COLOR"
    POSTGIT=" $RED\$$END_COLOR "
elif [[ "${OSTYPE}" == "linux-gnu" ]]; then
    POINTER_CHAR="⬆"
    PREINFO="\n$POINTER_CHAR $BIBLUE[ "$BLUE"exit: $WHITE\$?$BIBLUE ] [ "$BLUE"time: $WHITE\$(TZ='America/Los_Angeles' date +%H:%M:%S)$BIBLUE ]$END_COLOR"
    PREGIT="$PREINFO\n$WHITE\u $PURPLE@ $WHITE$ON_IRED\h$WHITE \w$END_COLOR"
    POSTGIT=" $RED\$$END_COLOR "
fi

export PROMPT_COMMAND="__git_ps1 \"$PREGIT\" \"$POSTGIT\""
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

# =============================================================================
# Aliases
# =============================================================================

if [[ "${OSTYPE}" == "darwin"* ]]; then
    alias grep='ggrep'
    alias hangoutsrage='sudo killall AppleCameraAssistant'
    alias vg='vagrant'
    alias la='ls -la'
elif [[ "${OSTYPE}" == "linux-gnu" ]]; then
    # ls
    LS_COLORS=$LS_COLORS:'di=0;34:' ; export LS_COLORS
    alias ls='ls -G --color'
    alias ll='ls -lG --color'
    alias la='ls -lGa --color'
fi

# dir navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ?='dirs -v'
alias +='pushd'
alias -- -='popd'
alias vi=nvim

# ip
alias myip="ifconfig | grep '^\s*inet ' | grep -v 127.0.0.1 | cut -d' ' -f2"

# =============================================================================
# Bash History
# =============================================================================
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# =============================================================================
# Miscellaneous
# =============================================================================
export CLICOLOR=1
export TERM="xterm-256color"
export EDITOR=nvim
export VISUAL=nvim

if [[ "${OSTYPE}" == "darwin"* ]]; then
    PG=/Users/max/src/playground
    GOSRC=/usr/local/Cellar/go/1.1

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# ps aux w/ grep
function psg {
    ps jaux|head -1 && ps jaux|GREP_OPTIONS= grep "$1" | GREP_OPTIONS= grep -v grep;
}

function psm {
    ps -eo size,pid,user,command | awk '{ hr=$1/1024 ; printf("%13.6f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }' | sort
}
