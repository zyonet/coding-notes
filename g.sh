#!/usr/bin/env bash
PY_PATH_STR="$(which python)"
# echo "${OUTPUT}"
# check if ``venv`` keyword is in string, if yes the virtualenv is activated already, else activate it
if [[ ${PY_PATH_STR} == *"/venv/"* ]]; then
    echo "yes, venv activated already"
else
    echo "no, activate venv now"
    source ./venv/bin/activate
    echo "venv activated"
fi
git add -A && git commit -m 'updates'