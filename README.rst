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


1. ``git checkout master``, update source of docs. ``git add . && git commit -m 'updated docs source' && git push``.

2. ``make html``

3. copy static html files to a ``tmp`` dir which shall reside outside the project directory.

4. ``git checkout gh-pages``

5. copy static html files in ``tmp`` dir to project directory, apply replacing strategy.

6. ``git add -A && git commit -m 'updated docs' && git push``

Done.

Note: You can also host your docs in *readthedocs*. Advantage: auto update docs site by git hook. Disadvantages: *readthedocs* will put ads in your docs page and the contents delivering speed seems slower than github.