#! /bin/bash

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

if [[ "${OSTYPE}" == "darwin"* ]]; then
    PATH="${PATH}:/usr/local/lib/node_modules"
    PATH="${PATH}:${HOME}/bin:${HOME}/.bin"
elif [[ "${OSTYPE}" == "linux-gnu" ]]; then
    PATH="${PATH}:/snap/bin"
    PATH="${PATH}:${HOME}/.local/bin"
fi

. ~/.zshrc
for PATHNAME in ~/.profile.d/*sh
    do . "${PATHNAME}"
done

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/max/Library/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/max/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/max/Library/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/max/Library/google-cloud-sdk/completion.zsh.inc'; fi

# The next line adds zsh completion installed by brew.
[ -f '/usr/local/etc/zsh_completion' ] && . '/usr/local/etc/zsh_completion'

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
