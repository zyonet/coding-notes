SVN
===

View colored svn diff
---------------------

1. how to view diff between two revisions

.. code:: bash

    svn diff -r 48354:48355

2. how to view colored svn diff on macos

step 1:

.. code:: bash

    brew install colordiff

step 2: 

open ``~/.subversion/config`` file, find the line containing ``diff-cmd`` then change it to ``diff-cmd = colordiff``.

Done.