#!/bin/bash

export HAWKUS_RELEASE_VERSION=${HAWKUS_RELEASE_VERSION:-"0.0.1-alpha"}

# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
# -- expects go executable binary to be at ${GO_EXEC_HOME}/go
# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #
export GO_EXEC_HOME=${GO_EXEC_HOME:-'/usr/local/go/bin'}
export PATH="$PATH:${GO_EXEC_HOME}"
go version || exit 1
export GOPATH=$(pwd)/go-hawkus-gate
mkdir -p bin
unset GOBIN
export GOBIN=$GOPATH/bin
rm -fr ${GOBIN} && mkdir -p ${GOBIN}

cd ${GOPATH}
# disable go modules for the build
export GOPATH=""

# disable cgo
export CGO_ENABLED=0

set -e
set -x

# linux
GOOS=linux GOARCH=amd64 go build -o release/linux/amd64/hawkus.gate
GOOS=linux GOARCH=arm64 go build -o release/linux/arm64/hawkus.gate
GOARCH=386 GOOS=linux go build -o release/linux/386/hawkus.gate

cd ./release/linux/386/
tar czvf hawkus-boilr-${BOILR_RELEASE_VERSION}-linux_386.tgz hawkus.gate
cd ../../../

cd ./release/linux/amd64/
tar czvf hawkus-gate-${HAWKUS_RELEASE_VERSION}-linux_amd64.tgz hawkus.gate
cd ../../../

cd ./release/linux/arm64/
tar czvf hawkus-gate-${HAWKUS_RELEASE_VERSION}-linux_arm64.tgz hawkus.gate
cd ../../../

echo ''
echo ''
echo '# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #'
echo '   Run:'
echo '# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #'
tree -alh -L 3
echo '# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #'
echo "          export DRONE_SECRET=dummydeadmeatmdeamt"
echo "          $(pwd)/release/linux/amd64/hawkus.gate"
echo "          $(pwd)/release/linux/arm64/hawkus.gate"
echo "          $(pwd)/release/linux/386/hawkus.gate"
# echo "          $(pwd)/release/darwin/386/hawkus.gate"
echo '# -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- # -- #'
echo ''
echo ''
