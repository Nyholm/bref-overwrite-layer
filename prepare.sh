#!/bin/bash

docker build -t bref/overwrite-layer .

rm -rf export/tmp/layer || true
mkdir -p export/tmp && cd export/tmp

docker run --entrypoint "tar" bref/overwrite-layer -ch -C /opt . | tar -x
zip --quiet -X --recurse-paths ../overwrite-layer.zip .

cd ../..
