#!/bin/bash

set -e

CUR="unknown"
if [[ -f "./version.txt" ]]; then
    CUR=$(cat ./version.txt)
fi

uname=$(uname)

if [[ -z "$TAG" ]]; then
    if [[ "$uname" = 'Darwin' ]]; then
        TAG=$(date -v-monday +%Y-%m-%d)
    else
        TAG=$(date -dlast-monday +%Y-%m-%d)
    fi
fi

echo "current version: $CUR"
if [[ "$CUR" = "$TAG" ]]; then
    echo "already up-to-date"
    exit 0
fi

echo "upgrading to $TAG"

if [[ -z "$DLNAME" ]]; then
    if [[ "$uname" = 'Darwin' ]]; then
        DLNAME=rust-analyzer-x86_64-apple-darwin
    else
        DLNAME=rust-analyzer-x86_64-unknown-linux-gnu
    fi
fi

GZFILE=$DLNAME.gz
RABIN=rust-analyzer

if [[ ! -f ./$GZFILE ]]; then
    TEMP=/tmp/$GZFILE
    wget $WGETARGS -O $TEMP "https://github.com/rust-analyzer/rust-analyzer/releases/download/$TAG/$GZFILE"
    mv $TEMP ./$GZFILE
fi

gzip -d -f $GZFILE
if [[ -f ./$RABIN ]]; then
    mv ./$RABIN ./$RABIN-old
    echo -e "\033[32mold version: $(./$RABIN-old --version || true)\033[0m"
fi

mv ./$DLNAME ./$RABIN
chmod a+x ./$RABIN
echo $TAG > ./version.txt
echo -e "\033[32mupgrade to version $TAG ($(./$RABIN --version))\033[0m"
