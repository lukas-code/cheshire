#!/bin/sh

set -eu

PIXI_VERSION=0.81.0
PIXI_HOME=$(realpath "$(dirname "$0")/../.pixi")

if ! [ -f "$PIXI_HOME/bin/pixi" ]; then
    mkdir -p "$PIXI_HOME/bin"
    curl --tlsv1.3 -sSfL -o "$PIXI_HOME/bin/pixi" "https://github.com/prefix-dev/pixi/releases/download/v$PIXI_VERSION/pixi-x86_64-unknown-linux-musl"
    chmod +x "$PIXI_HOME/bin/pixi"
fi

echo "export PIXI_HOME='$PIXI_HOME'"
# shellcheck disable=SC2016
echo 'export PATH="$PIXI_HOME/bin:$PATH"'
