#!/usr/bin/env bash

set -eu

VERSION_TAG=$1
IMAGE_TAG=destynova/urweb:$VERSION_TAG

docker build -t $IMAGE_TAG .
docker push $IMAGE_TAG
