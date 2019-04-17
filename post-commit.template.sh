#!/bin/sh
#
find . -path './.terraform' -prune -o -path '*/.terraform' -prune -o -name '*.tf' -exec sed -i "s,${REMOTE_PATH},${LOCAL_PATH}," {} \;
