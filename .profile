#! /bin/bash

if [[ "${OSTYPE}" == "darwin"* ]]; then
    PATH="/usr/local/bin:/usr/local/sbin:/usr/local/lib/node_modules"
    PATH="${PATH}:${HOME}/bin:${HOME}/.bin"
elif [[ "${OSTYPE}" == "linux-gnu" ]]; then
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
    PATH="${PATH}:${HOME}/.local/bin"
fi

for PATHNAME in ~/.profile.d/*sh
    do . "$PATHNAME"
done

