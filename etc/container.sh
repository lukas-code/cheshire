#!/bin/sh

set -exu

podman build -t localhost/cheshire -f etc/container/Containerfile
podman run -it --rm -v .:/repo --workdir /repo localhost/cheshire
