#!/usr/bin/env bash

if ! command -v dpkg-deb &> /dev/null; then
  echo "Missing command: dpkg-deb"
  exit 1
fi

if dpkg-deb 2>&1 | grep BusyBox &> /dev/null; then
  echo "The dpkg-deb binary provided by BusyBox is not compatible. The Debian tool needs to be used instead."
  exit 1
fi

echo "Packaging debian x64 distribution..."

VERSION=`jq -r ".version" package.json`

./node_modules/.bin/electron-installer-debian --config bin/deb-options.json --options.version=${VERSION} --arch amd64
