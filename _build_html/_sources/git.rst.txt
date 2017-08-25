Git
===

How to remove a folder from git tracking
----------------------------------------

Remove a folder from git repo without deleting it from my local machine:
``step1`` Add the folder path to your repo's root ``.gitignore`` file

.. code-block:: bash

    path_to_your_folder/

``step2`` Remove the folder from your local git tracking, but keep it on your disk. (``.gitignore`` will prevent untracked files from being added (without an add -f) to the set of files tracked by git, however git will continue to track any files that are already being tracked.) To stop tracking a file you need to remove it from the index. This can be achieved with this command.

.. code-block:: bash

    $ git rm -rf --cached path_to_your_folder/or_path_to_your_file

``step3`` Push your changes to your git repo.

.. code-block:: bash

    $ git commit -m "remove xyz file"


.. note:: The folder will be considered "deleted" from Git's point of view(i.e. they are in the past history, but not in the latest commit, and people pulling from this repo will get the files removed from their trees), but stay on your working directory because you've used --cached.



How to merge dev branch with master
-----------------------------------

``Method 1`` switching branches to merge

.. code-block:: bash

    # (on dev branch)
    $ git merge master
    # (resolve any conflicts if there are any)
    $ git checkout master
    $ git merge development
    # (there won't be any conflicts now)

.. tip:: If you want to keep track of who did the merge and when, you can use ``--no-ff`` flag while merging to do so. ``$ git merge --no-ff dev-branch-001``

``Method 2`` [Preferred] no branch switching

.. code-block:: bash

    $ git fetch origin master
    $ git merge master
    $ git push origin dev:master



How to checkout a tag
---------------------

``git clone`` will give you the whole repository.

After clone you can list the tags with ``$ git tag -l`` and then checkout a specific tag:

.. code-block:: bash

    $ git checkout tags/<tag_name>

Even better, checkout and create a branch (otherwise you will be on a branch named after the revision number of tag):

.. code-block:: bash

    $ git checkout tags/<tag_name> -b <branch_name>



Other useful directives
-----------------------

.. code-block:: bash

    $ git fetch
    $ git pull
    $ git stash
    $ git stash drop

How to do the initial commit
----------------------------

.. code-block:: bash

    $ rm -rf .git
    # optional
    $ git init
    $ git add . && git commit -m 'init'


Ref:

:git-cheat-sheet: https://github.com/arslanbilal/git-cheat-sheet/blob/master/README.md
:git forget a file: https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore
