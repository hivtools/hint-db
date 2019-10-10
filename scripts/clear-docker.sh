#!/usr/bin/env bash
docker kill $(docker ps -aq) 2> /dev/null || true
docker container prune --force
docker network prune --force
exit 0
