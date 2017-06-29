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
