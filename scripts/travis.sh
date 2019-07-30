#!/usr/bin/env bash
set -ex

git branch

echo $DOCKER_PASSWORD | \
    docker login -u $DOCKER_USERNAME --password-stdin


./scripts/build
./scripts/push

cd migrations
./scripts/build
./scripts/push