#!/usr/bin/env bash
set -x
set -e
HERE=$(dirname $0)
. $HERE/common

cd ../migrations
docker build \
       -f Dockerfile \
       -t "$TAG_SHA" \
       -t "$TAG_BRANCH" \
       $PACKAGE_ROOT

. $HERE/test_migrations.sh

docker push $TAG_SHA
docker push $TAG_BRANCH
