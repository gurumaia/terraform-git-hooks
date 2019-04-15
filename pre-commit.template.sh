#!/bin/sh
#
find . -path ./.terraform -prune -o -name '*.tf' -exec sed -i "s,${LOCAL_PATH},${REMOTE_PATH}," {} \; -exec git add {} \;