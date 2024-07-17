#!/usr/bin/env bash
ELECTRON_VERSION=125
BETTER_SQLITE3_VERSION=11.1.2

function download() {
    platform="$1"
    dest_name="$2"
    url=https://github.com/WiseLibs/better-sqlite3/releases/download/v${BETTER_SQLITE3_VERSION}/better-sqlite3-v${BETTER_SQLITE3_VERSION}-electron-v${ELECTRON_VERSION}-${platform}.tar.gz
    temp_file="temp.tar.gz"
    curl -L "$url" -o "$temp_file"
    tar -xzvf "$temp_file"
    mv build/Release/better_sqlite3.node "$dest_name-better_sqlite3.node"
    rm -rf build
    rm -f "$temp_file"
}

download "win32-x64" "win"
download "darwin-x64" "mac-x64"
download "darwin-arm64" "mac-arm64"