My coding notes written using Sphinx
====================================

How to run
----------

(You will need to setup the virtualenv first. Dependencies are listed in requirements.txt)

* Running from home dir

 The most convenient one is to open a terminal and type::

    $ . ./notes.sh

 Done. Now open http://localhost:8888 to view the coding notes.

* Running from Pycharm Project

 You can also open the terminal in `Pycharm` using shortcut `command + 3`, then type::

    $ sphinx-autobuild -p 8888 -H 0.0.0.0 . _build_html

 Or you can simply type::

    $ . ./run.sh

 Or you can simply press ``ctrl + R`` to run the project.

* Manually typing

 You can simply open a terminal, then you should be in the home directory, in **zsh** shell, type::

    $ . ./ridedocs.sh
    $ cd ~/PycharmProjects/notes
    $ sphinx-autobuild -p 8888 -H 0.0.0.0 . _build_html




How to deploy to github pages
-----------------------------

Manually
^^^^^^^^

1. ``git checkout master``, update source of docs. ``git add . && git commit -m 'updated docs source' && git push``.

2. ``make html``

3. copy static html files from ``_build/html`` to a ``tmp`` dir which shall reside outside the project directory.

4. ``git checkout gh-pages``

5. copy static html files in ``tmp`` dir to project directory, apply replacing strategy.

6. ``git add -A && git commit -m 'updated docs' && git push``

Done.

Automatically
^^^^^^^^^^^^^
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