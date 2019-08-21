#!/usr/bin/env bash
# get the name of the branch, only take actions when in master branch.
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
target="master"

PARENT_DIR="Repos"

if [ $branch = $target ]; then
    echo '[INFO] in master branch'
    echo '[INFO] make html'
    make html
    echo '[INFO] moving the generated html folder to /tmp dir'
    mv "$HOME"/"$PARENT_DIR"/coding-notes/_build/html /tmp
    echo '[INFO] checkout gh-pages branch'
    git checkout gh-pages
    branchghpages=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
    targetghpages="gh-pages"
    if [ $branchghpages = $targetghpages ]; then
        echo '[INFO] git pull in gh-pages branch'
        git pull
        echo '[INFO] copy html files to coding-notes dir'
        # use /tmp/html/* to move html files to /coding-notes dir
        # instead of moving /html folder to /coding-notes dir
        cp -vr /tmp/html/* "$HOME"/"$PARENT_DIR"/coding-notes
        rm -rf /tmp/html
        echo '[INFO] add & commit & push in gh-pages branch'
        git add -A && git commit -m 'updated docs in gh-pages' && git push
        echo '[INFO] checkout master & push updates'
        git checkout master && git push
        echo '[INFO] Done.'
        # the ``yes`` prevents you to be prompted to confirm each overwrite
        # yes | copy -vr /tmp/html ~/PycharmProjects/coding-notes
    else
        echo '[ERROR] checkout gh-pages failed.'
    fi
else
    echo '[INFO] NOT in master branch, nothing to do for post-commit.'
fi