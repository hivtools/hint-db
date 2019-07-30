#!/usr/bin/env bash
set -ex

if [["$DOCKER_PASSWORD" != ""]]
then
  echo $DOCKER_PASSWORD | \
    docker login -u $DOCKER_USERNAME --password-stdin
fi

./scripts/build
./scripts/push

cd migrations
./scripts/build
./scripts/push