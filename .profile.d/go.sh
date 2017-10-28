#! /bin/bash

export GOPATH="${HOME}"
export GO="${HOME}/src/github.com/smallstep-team"

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    # go
    PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
fi
