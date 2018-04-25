#!/bin/sh

alias ga='git add'
alias gb='git branch'
alias gbd='git branch -D'
alias gc='git checkout'
alias gcb='git checkout -B'
alias gcm='git checkout master'
alias gd='git diff --color'
alias gh='git --no-pager log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short -20'
alias gi='git commit -av'
alias gia='git commit -amend'
alias gl='git pull --rebase && git fetch --all'
alias glrm='git pull --rebase origin master && git fetch --all'
alias gm='git merge'
alias gp='git push'
alias gpf='git push --force'
alias gpm='git push origin master'
alias gpu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gs='git status'

function gr {
    if [ "$#" -ne 1 ]; then
        exit 1
    fi
    git rebase -i HEAD~"$1"
}
