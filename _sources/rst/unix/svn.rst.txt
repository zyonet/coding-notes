SVN
===

SVN blame
---------
svn blame (praise, annotate, ann) — Show author and revision information inline for the specified files or URLs.

.. todo:: make it complete.

Go to http://svnbook.red-bean.com/en/1.7/svn-book.html, then search for ``svn blame``.


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

Checkout a specific revisions
-----------------------------

.. code:: bash

    svn checkout -r 38156 http://tc-svn.tencent.com/basic/basic_avsdk_rep/avsdk_proj/release/OpenSDK1.9.8 OpenSDK1.9.8_r38156

