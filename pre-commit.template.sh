#!/bin/sh
#
git diff --cached --name-status |egrep '^M.*\.tf$' |awk '{print $2}' |while read FILE
do
    terraform fmt ${FILE}
    sed -i "s,${LOCAL_PATH},${REMOTE_PATH}," ${FILE}
    git add ${FILE}
done
