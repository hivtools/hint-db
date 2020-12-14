#!/usr/bin/env bash
set -e
HERE=$(dirname $0)
. $HERE/common

cd ..
docker build \
       -f Dockerfile \
       -t "$TAG_SHA" \
       -t "$TAG_BRANCH" \
       $PACKAGE_ROOT

docker push $TAG_SHA
docker push $TAG_BRANCH
