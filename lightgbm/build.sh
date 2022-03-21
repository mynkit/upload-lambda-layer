#!/bin/bash -x

set -e

rm -rf layer
docker build -t lightgbm-lambda-layer .
CONTAINER=$(docker run -d lightgbm-lambda-layer false)
docker cp $CONTAINER:/opt layer
docker rm $CONTAINER
touch layer/.slsignore
cat > layer/.slsignore << EOF
**/*.a
**/*.la
share/**
include/**
bin/**
EOF