#!/usr/bin/env bash

echo 'export = { buildDate:"'`date --iso-8601=seconds`'", buildRevision: "'`git log -1 --format="%H"`'" };' > src/services/build.ts