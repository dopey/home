#!/bin/sh

alias ga='git add'
alias gaf='git add -f'
alias gb='git --no-pager branch'
alias gbc='git checkout -B'   # I think of it as `git branch create`
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbdr='git push origin --delete'
alias gc='git checkout'
alias gd='git diff --color'
alias gi='git commit -av'
alias gia='git commit --amend'
alias glr='git pull --rebase && git fetch --all'
alias glrm='git pull --rebase origin master && git fetch --all'
alias gm='git merge'
alias gp='git push'
alias gpf='git push --force'
alias gpm='git push origin master'
alias gpu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias grh='git reset --hard'
alias grom='git reset --hard origin/master'
alias gs='git status'
alias gso='git show'
alias gtd='git tag -d'
alias gtp='git push origin tag $(git describe --tags --dirty)'
alias ggrep='git grep'

# Git checkout 'master' or 'main' branch
function gcm() {
    git show-ref --verify --quiet refs/heads/master
    if [ $? -eq 0 ]; then
        git checkout master
    else
        git checkout main
    fi
}

# Git branch delete local and remote
function gbdlr() {
    if [ "$#" -ne 1 ]; then
        echo "Error: gdblr expects 1 positional argument -- <branch> to be deleted"
        return 1
    fi
    git branch -d "${1}" && git push --delete origin "${1}"
}

# Git branch delete local and remote
function gbDlr() {
    if [ "$#" -ne 1 ]; then
        echo "Error: gdblr expects 1 positional argument -- <branch> to be deleted"
        return 1
    fi
    git branch -D "${1}" && git push --delete origin "${1}"
}

# Git tag delete local and remote
function gtdlr() {
    if [ "$#" -ne 1 ]; then
        echo "Error: gtdlr expects 1 positional argument -- <tag> to be deleted"
        return 1
    fi
    git tag -d "${1}" && git push --delete origin "${1}"
}

# Git tag push local and remote
function gtplr() {
    if [ "$#" -ne 1 ]; then
        echo "Error: gtplr expects 1 positional argument -- <tag> to be deleted"
        return 1
    fi
    git tag "${1}" && git push origin tag "${1}"
}

# Git Rebase
function gr() {
    if [ "$#" -ne 1 ]; then
        echo "Error: git rebase requires arguments"
        return 1
    fi
    if [ $1 -eq $1 2>/dev/null ]; then
        git rebase -i HEAD~"$1"
    else
        git rebase $1
    fi
}

# Git Tag
function gt() {
    if [ "$#" -eq 0 ]; then
        git -c 'versionsort.suffix=-' tag -l --sort=-v:refname | head -20
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
