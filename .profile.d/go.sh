#! /bin/bash

export GOPATH="${HOME}"

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    # go
    PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
fi
