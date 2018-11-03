#! /bin/bash

export GOPATH="${HOME}"

export WORK="${GOPATH}/src/github.com/smallstep"
export CA="${WORK}/certificates"
export CLI="${WORK}/cli"
export STEP="${WORK}/step"
export STEPPATH="${STEP}/.step"

PATH="${PATH}:${CLI}/bin"

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    # go
    PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
fi

cover () {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}
