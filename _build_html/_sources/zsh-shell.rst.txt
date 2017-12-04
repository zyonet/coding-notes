Zsh Shell
=========

.. _zsh_important_stuff:

How to install Zsh
------------------

.. note:: After you have installed ``zsh`` please copy all the things from ``~/.bash_profile`` to ``~/.zshrc`` file. Otherwise lots of commands are not callable (Or simply uncomment the second line in ``.zshrc``).

``step 1`` `Installing ZSH <https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH>`_

``step 2`` Install `oh-my-zsh <https://github.com/robbyrussell/oh-my-zsh>`_ which is an open source, community-driven framework for managing your `zsh <http://www.zsh.org>`_ configuration


Run .sh on macOS
----------------

There are two ways for running the shell script (``.sh`` file):

1. in Mac original terminal

.. code-block:: bash

    $ . env.sh

2. zsh shell:

.. code-block:: bash

    $ . ./env.sh

Or:

.. code-block:: bash

    $ source env.sh


Run .sh with python supervisor
------------------------------

In supervisor ``.conf`` file, you need to precede the full path of ``.sh`` file with ``/bin/bash``, e.g,:

.. code-block:: bash

    command: /bin/bash /home/ubuntu/zwapbe/docs.sh


Monitoring system resources
---------------------------

You can use native ``$ top``, or install ``htop`` (*an interactive process viewer for Unix*) and type:

.. code-block:: bash

    $ htop

Ref:

:htop: http://hisham.hm/htop/

How to inspect the environment variables
----------------------------------------

Type in terminal:

.. code-block:: bash

    $ printenv

