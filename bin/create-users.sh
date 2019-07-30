#!/usr/bin/env bash
set -ex

dropdb -U hint --if-exists hint
createdb -U hintuser hint