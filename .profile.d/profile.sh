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
alias hangoutsrage='sudo killall AppleCameraAssistant'
alias vg='vagrant'

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
PP=${WORK}/puppet-betable
GOSRC=/usr/local/Cellar/go/1.1

EDITOR=vim
VISUAL=vim

GRAMMAR=~/Desktop/SHARED/aenea

export PATH
export WORK
export PYTHONPATH

# CASSANDRA ENV VARS
export CASSANDRA_NODES="127.0.0.1:9160"
export CASSANDRA_USERNAME="cassandra"
export CASSANDRA_PASSWORD="cassandra"
export CASSANDRA_CERTIFICATE="/etc/ssl/certs/betable-ca.pem"
export CASSANDRA_TRUSTSTORE="/etc/cassandra/client-truststore"
export CASSANDRA_TRUSTSTORE_PASSWORD="betable"
export CASSANDRA_AUTH_ENABLED="false"
export CASSANDRA_SSL_ENABLED="false"
export CASSANDRA_ALT_NAME="cassandra-development"


export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Fixes Java stuff launching into the dock and messing with Spaces
export _JAVA_OPTIONS=-Djava.awt.headless=false

function precise {
   nohup VBoxHeadless -startvm "betable-ubuntu64" &
}

function trusty {
   nohup VBoxHeadless -startvm "betable-trusty64" &
}

function psg {
    ps jaux|head -1 && ps jaux|GREP_OPTIONS= grep "$1" | GREP_OPTIONS= grep -v grep;
}

function psm {
    ps -eo size,pid,user,command | awk '{ hr=$1/1024 ; printf("%13.6f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }' | sort
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
