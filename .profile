#! /bin/bash

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

if [[ "${OSTYPE}" == "darwin"* ]]; then
    PATH="${PATH}:/usr/local/lib/node_modules"
    PATH="${PATH}:${HOME}/bin:${HOME}/.bin"
elif [[ "${OSTYPE}" == "linux-gnu" ]]; then
    PATH="${PATH}:/snap/bin"
    PATH="${PATH}:${HOME}/.local/bin"
fi

for PATHNAME in ~/.profile.d/*sh
    do . "${PATHNAME}"
done

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/max/Library/google-cloud-sdk/path.bash.inc' ]; then source '/Users/max/Library/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/max/Library/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/max/Library/google-cloud-sdk/completion.bash.inc'; fi

# The next line adds bash completion.
[ -f '/usr/local/etc/bash_completion' ] && . '/usr/local/etc/bash_completion'
