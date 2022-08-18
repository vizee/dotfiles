#!/bin/bash

set -ex

cd "$(dirname $0)"

if [[ -z "$(pgrep dwmstatus\.sh)" ]]; then
./dwmstatus.sh &
fi

fcitx5 -d
