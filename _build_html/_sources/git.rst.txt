Git
===

Typical git workflow
--------------------
Use command line to add your project to remote repo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ref: https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/

.. code-block:: bash

        $ git init
        $ git add .
        # Adds the files in the local repository and stages them for commit.
        # To unstage a file, use `git reset HEAD YOUR-FILE`.

        $ git commit -m "First commit"
        # Commits the tracked changes and prepares them to be
        # pushed to a remote repository. To remove this commit and
        # modify the file, use `git reset --soft HEAD~1\` and
        # commit and add the file again.

        # **Action**: copy remote repository URL

        $ git remote add origin `remote repo URL`
        # Sets the new remote

        $ git remote -v
        # Verifies the new remote URL

        $ git push -u origin master
        # Pushes the changes in your local repository up
        # to the remote repository you specified as origin

        # `-u` here looks like the simplified version of `set-upstream`
        # only use it when the first time you add the remote repo for your project.

After you have added your project to remote repo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ git status
    $ git add path/to/file/that/has/been/modified
    # or add all that have been modified
    $ git add .
    $ git commit -m 'file been modified'
    $ git push
    $ git status
    $ git pull

    $ git stash
    $ git stash show
    $ git stash list
    $ git stash apply


Remote's URL
------------

1. List remote's URL: ``git remote -v``

2. Change remote's URL:

.. code-block:: bash

    # use https
    $ git remote set-url origin https://github.com/USERNAME/REPOSITORY.git

    # use ssh
    $ git remote set-url origin git@github.com:USERNAME/REPOSITORY.git

Difference between `git add -A` and `git add .`
-----------------------------------------------

1. ``git add -A`` stages **all**
2. ``git add .`` stages new and modified, **without deleted**
3. ``git add -u`` stages modified and deleted, **without new**

The important point about git add . is that it looks at the working tree and adds all those paths to the staged changes if they are either changed or are new and not ignored, it does not stage any 'rm' actions.

git add -u looks at all the already tracked files and stages the changes to those files if they are different or if they have been removed. It does not add any new files, it only stages changes to already tracked files.

git add -A is a handy shortcut for doing both of those.

You can test the differences out with something like this (note that for Git version 2.x your output for git add . git status will be different):

.. code-block:: bash

    git init
    echo Change me > change-me
    echo Delete me > delete-me
    git add change-me delete-me
    git commit -m initial

    echo OK >> change-me
    rm delete-me
    echo Add me > add-me

    git status
    # Changed but not updated:
    #   modified:   change-me
    #   deleted:    delete-me
    # Untracked files:
    #   add-me

    git add .
    git status

    # Changes to be committed:
    #   new file:   add-me
    #   modified:   change-me
    # Changed but not updated:
    #   deleted:    delete-me

    git reset

    git add -u
    git status

    # Changes to be committed:
    #   modified:   change-me
    #   deleted:    delete-me
    # Untracked files:
    #   add-me

    git reset

    git add -A
    git status

    # Changes to be committed:
    #   new file:   add-me
    #   modified:   change-me
    #   deleted:    delete-me


Git Tags How tos
----------------
How to ignore all present untracked files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Q: Is there a handy way to ignore all untracked files and folders in a git repository?

A: If you want to permanently ignore these files, a simple way to add them to .gitignore is

``git ls-files --others --exclude-standard >> .gitignore``




How to remove a folder from git tracking
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``Method 1`` switching branches to merge

.. code-block:: bash

    # (on ``dev`` branch)
    $ git merge master
    # (resolve any conflicts if there are any)
    $ git checkout master
    $ git merge dev
    # (there won't be any conflicts now)

.. tip:: If you want to keep track of who did the merge and when, you can use ``--no-ff`` flag while merging to do so. ``$ git merge --no-ff dev-branch-001``

``Method 2`` [Preferred] no branch switching

.. code-block:: bash

    $ git fetch origin master
    $ git merge master
    $ git push origin dev:master
    # `dev` is the name of current branch

How to create a tag
^^^^^^^^^^^^^^^^^^^

Annotated Tags
""""""""""""""

.. code-block:: bash

    $ git tag -a v1.0.3 -m 'my version v1.0.3'
    # notice that do not use double quota here, otherwise it will have error of too many params
    $ git tag
    v1.0.1
    v1.0.2
    v1.0.3
    $ git show v1.0.3



Lightweight Tags
""""""""""""""""

.. code-block:: bash

    $ git tag v1.0.3


How to show tag info
^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ git show v1.0.3

How to list all tags
^^^^^^^^^^^^^^^^^^^^

1. local: ``git tag``

2. remote: ``git ls-remote --tags origin``

How to push tag
^^^^^^^^^^^^^^^

1. push particular tag: ``git push v1.0.3``

2. push all tags: ``git push --tags``

How to delete tag
^^^^^^^^^^^^^^^^^

1. delete remote tag: ``git push --delete origin tagname``

2. delete local tag: ``git tag --delete tagname``


How to checkout a tag
^^^^^^^^^^^^^^^^^^^^^

``git clone`` will give you the whole repository.

After clone you can list the tags with ``$ git tag -l`` and then checkout a specific tag:

.. code-block:: bash

    $ git checkout tags/<tag_name>

Even better, checkout and create a branch (otherwise you will be on a branch named after the revision number of tag):

.. code-block:: bash

    $ git checkout tags/<tag_name> -b <branch_name>



Other useful directives
^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ git ls-files
    $ git fetch
    $ git pull
    $ git stash
    $ git stash drop
    $ git stash apply

How to do the initial commit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ rm -rf .git
    # optional
    $ git init
    $ git add . && git commit -m 'init'

About git config files
^^^^^^^^^^^^^^^^^^^^^^
Reference:

1. `git-scm.com/docs/git-config#FILES <https://git-scm.com/docs/git-config#FILES>`_.
2. `XDG Base Directory Specification <https://specifications.freedesktop.org/basedir-spec/basedir-spec-0.6.html>`_.

.. note:: About ``echo $XDG_CONFIG_HOME``.

        1. Basics: There is a single base directory relative to which user-specific
        configuration files should be written. This directory is defined by
        the environment variable ``$XDG_CONFIG_HOME``.

        2. Environment variables: ``$XDG_CONFIG_HOME`` defines the base
        directory relative to which user specific configuration files
        should be stored. If ``$XDG_CONFIG_HOME`` is either not set or
        empty, a default equal to ``$HOME/.config`` should be used.


Typically four git config files:

1. ``$/etc/gitconfig`` system-wide configuration file

2. ``$XDG_CONFIG_HOME/git/config`` second user-specific configuration file. If ``$XDG_CONFIG_HOME`` is not set or empty, ``$HOME/.config/git/config`` will be used. Any single-valued variable set in this file will be overwritten by whatever is in ``~/.gitconfig``. t is a good idea not to create this file if you sometimes use older versions of Git, as support for this file was added fairly recently.

3. ``~/.gitconfig`` User-specific configuration file. Also called **global** configuration file.

4. ``$GIT_DIR/config`` Repository specific configuration file.

The files are read in the order given above, with last value found
taking precedence over values read earlier.


you can also find/edit those configuration files running the commands:

.. code-block:: bash

    $ git config --global -e
    $ git config --system -e
    $ git config --local -e

Setup username and email:

.. code-block:: bash

    $ git config --global user.name "Pharrell_zx"
    $ git config --global user.email wzxnuaa@gmail.com


ssh-add
-------

`Could not open a connection to your authentication agent <https://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent>`_

If you cannot successfully perform ``ssh-add``, you can do this:

.. code-block:: bash

    $ eval `ssh-agent -s`
    $ ssh-add

You can add below scripts to the end of ``/root/.bashrc`` file to
automatically load ``ssh-agent``:

.. code-block:: bash

    eval $(ssh-agent) > /tmp/tmp.txt
    echo ======== for bitbucket pull/push without password =========
    ssh-add /root/.ssh/zwap_prod_root_2 > /tmp/tmp1.txt
    echo ======== for bitbucket pull/push without password =========


Detached HEAD
-------------

Reference: https://www.git-tower.com/learn/git/faq/detached-head-when-checkout-commit

Understand how checkout works
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Normally, you use a branch name to communicate with "git checkout":

.. code-block:: bash

        $ git checkout development

However, you can also provide the SHA1 hash of a specific commit instead:

.. code-block:: bash

        $ git checkout 56a4e5c08
        Note: checking out `56a4e5c08`.

        You are in 'detached HEAD' state...

This exact state - when a specific commit is checked out
instead of a branch - is what's called a "detached HEAD".

The problem with detached HEAD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The **HEAD** pointer in Git determines your current working revision
(and thereby the files that are placed in your project's working directory).

.. note:: Normally, when checking out a proper branch name, Git automatically moves the HEAD pointer along when you create a new commit. You are automatically on the newest commit of the chosen branch.
        When you instead choose to check out a commit hash, Git won't do this for you. The consequence is that when you make changes and commit them, these changes do NOT belong to any branch.
        This means they can easily get lost once you check out a different revision or branch: not being recorded in the context of a branch, you lack the possibility to access that state easily (unless you have a brilliant memory and can remember the commit hash of that new commit...).

If you want to go back in time to try out an older version of your project
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Remember how simple and cheap the whole concept of branching is in Git:
you can simply create a (temporary) branch and delete it once you're done.

.. code-block:: bash

        $ git checkout -b test-branch 56a4e5c08

        ...do your thing...

        $ git checkout master
        $ git branch -d test-branch


Part of the References:

:git-cheat-sheet: https://github.com/arslanbilal/git-cheat-sheet/blob/master/README.md
:git forget a file: https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore
