#!/bin/sh

. $HOME/.profile.d/colors.sh

export CLICOLOR=1
export TERM="xterm-256color"
export GREP_OPTIONS='--color=auto -r'

#########################
# Aliases
#########################
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -lGa'
alias ..='cd ..'
alias ...='cd ../..'
alias +='pushd'
alias -- -='popd'
alias ?='dirs -v'
alias myip="ifconfig | grep inet  | grep -v 127.0.0.1 | cut -d\ -f2"

POINTER_CHAR="⬆"
PREINFO="\n$POINTER_CHAR $BIBLUE[ "$BLUE"exit: $WHITE\$?$BIBLUE ] [ "$BLUE"time: $WHITE\t$BIBLUE ]$END_COLOR"
PREGIT="$PREINFO\n$WHITE\u $PURPLE@ $BLUE\h$WHITE \w$END_COLOR"
POSTGIT=" $RED\$$END_COLOR "

export PROMPT_COMMAND="__git_ps1 \"$PREGIT\" \"$POSTGIT\""

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

PATH="$PATH:~/.bin"
PATH=/Users/max/bin:${PATH}
PATH=/usr/local/bin:${PATH}
PATH=/usr/local/sbin:${PATH}
PATH=/Users/max/Documents/work/cassandra-1.0.10/bin:${PATH}
PATH=/usr/local/Cellar/ruby/1.9.3-p194:${PATH}
PATH=/usr/local/lib/node_modules:${PATH}

WORK=/Users/max/src/git.ops.betable.com
PYTHONPATH=${PYTHONPATH}:/Users/max/Desktop/SHARED/aenea/util

GAMES=${WORK}/betable-games
ADMIN_GAMES=${WORK}/betable-admin-games
GAME_CONFIG=${WORK}/node-betable-game-configuration
ID=${WORK}/betable-id
ADMIN_ID=${WORK}/betable-admin-id
GOSRC=/usr/local/Cellar/go/1.1

EDITOR=vim
VISUAL=vim

GRAMMAR=~/Desktop/SHARED/aenea

export PATH
export WORK
export PYTHONPATH


export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Fixes Java stuff launching into the dock and messing with Spaces
export _JAVA_OPTIONS=-Djava.awt.headless=true

function vbp {
   nohup VBoxHeadless -startvm "betable-ubuntu64" &
}
