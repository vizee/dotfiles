#!/bin/bash

set -ex

cd "$(dirname $0)"

if [[ -z "$(pgrep dwm-status)" ]]; then
./dwm-status &
fi

fcitx5 -d
