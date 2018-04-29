#!/bin/sh

alias ga='git add'
alias gb='git branch'
alias gbd='git branch -D'
alias gc='git checkout'
alias gcb='git checkout -B'
alias gcm='git checkout master'
alias gd='git diff --color'
alias gi='git commit -av'
alias gia='git commit -amend'
alias gl='git pull --rebase && git fetch --all'
alias glrm='git pull --rebase origin master && git fetch --all'
alias gm='git merge'
alias gp='git push'
alias gpf='git push --force'
alias gpm='git push origin master'
alias gpt='git push origin tag $(git describe --tags --dirty | sed "s/^v//")'
alias gpu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gs='git status'

# Git Rebase
function gr() {
    if [ "$#" -ne 1 ]; then
        echo "Error: missing number of commits for rebase"
        return 1
    fi
    git rebase -i HEAD~"$1"
}

# Git Tag
function gt() {
    if [ "$#" -eq 0 ]; then
        git tag | sed 's|.*/\(.*\)$|\1|' | grep -v '\^' | sort -t. -k1,1nr -k2,2nr -k3,3nr -k4,4nr | head -20
    elif [ "$#" -eq 1 ]; then
        git tag "$1"
    else
        echo "Error: 'git tag' can have 0 or 1 parameters only."
        return 1
    fi
}

# Git History
function gh() {
    if [ "$#" -eq 0 ]; then
        git --no-pager log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short -20
    elif [ "$#" -eq 1 ]; then
        git --no-pager log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short -$1
    else
        echo "Error: 'git hist' can have 0 or 1 parameters only: Cannot run w/ '$@'."
        return 1
    fi
}
