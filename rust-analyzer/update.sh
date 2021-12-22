#!/bin/bash

set -e

CUR="unknown"
if [[ -f "./version.txt" ]]; then
    CUR=$(cat ./version.txt)
fi

if [ -z "$TAG" ]; then
TAG=$(date -dlast-monday +%Y-%m-%d)
fi

echo "current version: $CUR"
if [[ "$CUR" = "$TAG" ]]; then
    echo "already up-to-date"
    exit 0
fi

echo "upgrade to $TAG"

GZFILE=rust-analyzer-x86_64-unknown-linux-gnu.gz

if [[ ! -f ./$GZFILE ]]; then
    [[ -z "$TAG" ]] && echo "TAG not set" && exit 1

    TEMP=/tmp/$GZFILE
    wget -O $TEMP "https://github.com/rust-analyzer/rust-analyzer/releases/download/$TAG/$GZFILE"
    mv $TEMP ./$GZFILE
fi

gzip -d -f $GZFILE
if [[ -f ./rust-analyzer-linux ]]; then
    mv ./rust-analyzer-linux ./rust-analyzer-linux-old
    echo -e "\033[32mold version: $(./rust-analyzer-linux-old --version || true)\033[0m"
fi

mv ./rust-analyzer-x86_64-unknown-linux-gnu ./rust-analyzer-linux
chmod a+x ./rust-analyzer-linux
echo $TAG > ./version.txt
echo -e "\033[32mupgrade to version $TAG ($(./rust-analyzer-linux --version))\033[0m"
