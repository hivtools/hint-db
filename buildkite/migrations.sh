#!/usr/bin/env bash
set -x
set -e
HERE=$(dirname $0)
. $HERE/common

IMAGE_NAME=hint-db-migrate
TAG_SHA="mrcide/${IMAGE_NAME}:${GIT_ID}"
TAG_BRANCH="mrcide/${IMAGE_NAME}:${GIT_BRANCH}"
PACKAGE_ROOT=$(realpath $HERE/../migrations)

cd PACKAGE_ROOT && docker build \
       -f Dockerfile \
       -t "$TAG_SHA" \
       -t "$TAG_BRANCH" \
       $PACKAGE_ROOT

. $HERE/test_migrations.sh

docker push $TAG_SHA
docker push $TAG_BRANCH
