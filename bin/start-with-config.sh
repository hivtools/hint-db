#!/usr/bin/env bash
set -ex
CONFIG_FILE=$1
shift
exec /usr/local/bin/docker-entrypoint.sh $* -c config_file=$CONFIG_FILE