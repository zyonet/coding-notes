#!/usr/bin/env bash
# get the name of the branch, only take actions when in master branch.
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
target="master"

PARENT_DIR="repos" # redundent comment for post-commit testing

if [ $branch = $target ]; then
    # echo -e "\033[1;31m This is red text \033[0m"
    echo -e "\033[1;31m [INFO] in master branch \033[0m"
    echo -e "\033[1;31m [INFO] make html \033[0m"
    make html

    echo -e "\033[1;31m [INFO] moving the generated html folder to /tmp dir \033[0m"
    mv "$HOME"/"$PARENT_DIR"/coding-notes/_build/html /tmp

    echo -e "\033[1;31m [INFO] checkout gh-pages branch \033[0m"
    git checkout gh-pages
    branchghpages=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
    targetghpages="gh-pages"
    if [ $branchghpages = $targetghpages ]; then
        echo -e "\033[1;31m [INFO] git pull in gh-pages branch \033[0m"
        git pull

        echo -e "\033[1;31m [INFO] copy html files to coding-notes dir \033[0m"
        # use /tmp/html/* to move html files to /coding-notes dir
        # instead of moving /html folder to /coding-notes dir
        cp -vr /tmp/html/* "$HOME"/"$PARENT_DIR"/coding-notes
        rm -rf /tmp/html

        echo -e "\033[1;31m [INFO] add & commit & push in gh-pages branch \033[0m"

        git add -A && git commit -m 'updated docs in gh-pages' && git push
        echo -e "\033[1;31m [INFO] checkout master & push updates \033[0m"

        git checkout master && git push
        echo -e "\033[1;31m [INFO] Done \033[0m"
        # the ``yes`` prevents you to be prompted to confirm each overwrite
        # yes | copy -vr /tmp/html ~/PycharmProjects/coding-notes

    else
        echo -e "\033[1;31m [ERROR] checkout gh-pages failed \033[0m"
    fi
else
    echo -e "\033[1;31m [INFO] NOT in master branch, nothing to do for post-commit \033[0m"
fi