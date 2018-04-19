There are **three** ways to run.

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


