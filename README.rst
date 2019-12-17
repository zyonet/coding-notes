Coding Notes
============

Development
-----------

.. tip:: Setup the Python virtualenv first. Dependencies are listed in *requirements.txt*

Type below command in Terminal then press *Enter*:

.. code-block:: bash

    . ./run.sh

Deployment
----------

**In a nutshell**: make use of git ``post-commit`` hook to automate the deploying process.

1. Make necessary modifications to :download:`post-commit.sh <_static/downloads/post-commit.sh>` and 

2. copy the modified version to ``.git/hooks/post-commit``, then 

3. ``chmod u+x .git/hooks/post-commit`` to make it executable. After this, whenever ``git add -A && git commit -m 'updates'`` has been used to update ``master`` branch, ``gh-pages`` branch will be updated automatically.

.. warning:: ``git pull`` will not update git hooks. Hence every time after cloning a new copy, hooks need to be set up manually.

.. note:: You can also host your docs in *readthedocs*.

    1. Advantage: auto update docs site by git hook without your configuration.

    2. Disadvantages: *readthedocs* will put ads in your docs page and the contents delivering speed seems slower than github.