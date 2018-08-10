#! /bin/bash

export GOPATH="${HOME}"
export STEP="${GOPATH}/src/github.com/smallstep"
export CLI="${STEP}/cli"

PATH="${PATH}:${CLI}/bin"

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    # go
    PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
fi

cover () {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}
