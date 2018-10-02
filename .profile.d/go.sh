#! /bin/bash

export GOPATH="${HOME}"
export STEP="${GOPATH}/src/github.com/smallstep"
export STEPPATH="${GOPATH}/src/github.com/smallstep/step/.step"
export CLI="${STEP}/cli"
export CA="${STEP}/ca-component"
export STEP="${GOPATH}/src/github.com/smallstep/step/.step"

PATH="${PATH}:${CLI}/bin"

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    # go
    PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
fi

cover () {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}
