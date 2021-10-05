#! /bin/sh

export GOPATH="${HOME}"

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    # go
    PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"
fi

cover () {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}
