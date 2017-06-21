#! /bin/bash

if [ "${OSTYPE}" == "darwin"* ]; then
    for PATHNAME in ~/.home-profile.d/*sh
        do . "$PATHNAME"
    done
elif [ "${OSTYPE}" == "linux-gnu" ]; then
    for PATHNAME in ~/.linux-profile.d/*sh
        do . "$PATHNAME"
    done
fi

for PATHNAME in ~/.profile.d/*sh
    do . "$PATHNAME"
done
