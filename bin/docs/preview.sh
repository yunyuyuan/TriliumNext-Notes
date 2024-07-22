#!/usr/bin/env bash

script_dir=$(realpath $(dirname $0))
output_dir="$script_dir/../docs"
httpd -fv -p 127.0.0.1:8089 -h "$output_dir"