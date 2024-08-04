#!/usr/bin/env bash

if ! command -v magick &> /dev/null; then
  echo "This tool requires ImageMagick to be installed in order to create the icons."
  exit 1
fi

if ! command -v icnsutil &> /dev/null; then
  echo "This tool requires icnsutil to be installed in order to generate macOS icons."
  exit 1
fi

script_dir=$(realpath $(dirname $0))
cd "${script_dir}/../images/app-icons"
magick -background none "../icon-color.svg" -resize 180x180 "./ios/apple-touch-icon.png"

# Build PNGs
magick -background none "../icon-color.svg" -resize "128x128" "./png/128x128.png"
magick -background none "../icon-color.svg" -resize "256x256" "./png/256x256.png"
magick -background none "../icon-purple.svg" -resize "256x256" "./png/256x256-dev.png"

# Build Mac .icns
declare -a sizes=("16x16" "32x32" "512x512" "1024x1024")
for size in "${sizes[@]}"; do
    magick -background none "../icon-color.svg" -resize "${size}" "./png/${size}.png"
done
icnsutil compose -f "mac/icon.icns" "./png/16x16.png" "./png/32x32.png" "./png/128x128.png" "./png/512x512.png" "./png/1024x1024.png"

# Build Windows icon
magick -background none "../icon-color.svg" -define icon:auto-resize=16,32,48,64,128,256 "./win/icon.ico"

# Build Squirrel splash image
magick "./png/256x256.png" -background "#ffffff" -gravity center -extent 640x480 "./win/setup-banner.gif"