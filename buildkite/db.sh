#!/usr/bin/env bash
set -e
HERE=$(dirname $0)
. $HERE/common

IMAGE_NAME=hint-db
TAG_SHA="mrcide/${IMAGE_NAME}:${GIT_ID}"
TAG_BRANCH="mrcide/${IMAGE_NAME}:${GIT_BRANCH}"
PACKAGE_ROOT=$(realpath $HERE/..)

cd ..
docker build \
       -f Dockerfile \
       -t "$TAG_SHA" \
       -t "$TAG_BRANCH" \
       $PACKAGE_ROOT

docker push $TAG_SHA
docker push $TAG_BRANCH
