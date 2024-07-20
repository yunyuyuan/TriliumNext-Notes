#!/usr/bin/env bash

if [ ! -f .env ]; then
    echo "Missing .env file, cannot proceed."
    exit 1
fi

script_dir=$(realpath $(dirname $0))
output_dir="$script_dir/../docs"
mkdir -p "$output_dir"
rm -f "$output_dir"/*
rm -rf "$output_dir"/{assets,share}

source ./.env

# Download everything in output/notes.example.com/share/...
share_url="$SHARE_PROTOCOL://$SHARE_HOST/share/$ROOT_NOTE_ID"
wget -rpEk -e robots=off "$share_url" -P "$output_dir"

# Get rid of the domain in the output folder
mv "$output_dir/$SHARE_HOST"/* "$output_dir/"
rmdir "$output_dir/$SHARE_HOST"

# Create home page with redirect
index_dest_path="$output_dir/index.html"
cp index.template.html "$index_dest_path"
sed -i "s/{{ROOT_NOTE_ID}}/$ROOT_NOTE_ID/g" "$index_dest_path"

# Rewrite links to get rid of the share folder
sed -i "s/<link href=\"\\.\\./<link href=\"\\./g" "$output_dir/share"/*.html
sed -i "s/<script src=\"\\.\\./<script src=\"\\./g" "$output_dir/share"/*.html
sed -i "s/rel=\"shortcut icon\" href=\"\\.\\./rel=\"shortcut icon\" href=\"\\./g" "$output_dir/share"/*.html
mv "$output_dir/share"/* "$output_dir"
rmdir "$output_dir/share"