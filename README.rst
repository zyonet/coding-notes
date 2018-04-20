My coding notes written using Sphinx
====================================

How to run
----------

.. tip:: You will need to setup the virtualenv first. Dependencies are listed in requirements.txt

* Running from Pycharm Project root dir:

 Open the terminal in `Pycharm` using shortcut `command + 3`, then type::

    $ . ./run.sh


How to deploy to github pages
-----------------------------
Making use of git ``post-commit`` hook to automate the deploying process.

Download and take a look at example post-commit file which has been used
by this project:

:download:`post-commit.sh <_static/downloads/post-commit.sh>`

Copy contents in ``post-commit.sh`` to ``.git/hooks/post-commit``, then ``chmod u+x .git/hooks/post-commit``
to make it executable. After this, when
``git add -A && git commit -m 'updates'`` has been used to update ``master``
branch, ``gh-pages`` branch will be updated automatically.

.. note:: You can also host your docs in *readthedocs*.

            1. Advantage: auto update docs site by git hook without your configuration.

            2. Disadvantages: *readthedocs* will put ads in your docs page and the contents delivering speed seems slower than github.