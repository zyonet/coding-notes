GitBook How To
==============

`Gitbook <www.gitbook.com>`_ has advanced to a new version at the time
of writing this note [April 19, 2018].

Website for new version is shown in :numref:`new_gitbook_website_capture`,
for legacy version is shown in :numref:`legacy_gitbook_website_capture`.

.. _new_gitbook_website_capture:
.. figure:: ./images/gitbook-now.png
   :scale: 20%
   :alt: gitbook_now

   Screen Grab for Website of new GitBook

.. _legacy_gitbook_website_capture:
.. figure:: ./images/gitbook-legacy.png
   :scale: 20%
   :alt: gitbook_legacy

   Screen Grab for Website of legacy GitBook


The new GitBook has indeed introduced some nice new features. But it no longer allow exporting docs as static html files (see `Important Differences <https://docs.gitbook.com/what-is-new/important-differences#cli-toolchain>`_), which is a huge loss to users like me.

Here I am documenting a way to keep using legacy GitBook and publishing exported static files to github pages.

.. note:: Below guides assume you have ``npm`` installed already. (It is recommended to install ``npm`` using ``nvm``, which is the acronym of *Node Version Manager*).

Safely install gitbook-cli
--------------------------

Currently you can continue to use ``$ npm install -g gitbook-cli`` to
install it from official package uploaded by gitbook. But in case it will
not be available in the future, we can clone a new copy in github, then install
gitbook-cli in a hacking manner.


step1: fork https://github.com/GitbookIO/gitbook-cli to your github repo.

step2: use ``npm root -g`` to know where ``npm install -g`` installs packages to in your file system.

step3: suppose the commandline output of step2 is ``/Users/pharrell_wang/.nvm/versions/node/v9.5.0/lib/node_modules``, then type ``cd /Users/pharrell_wang/.nvm/versions/node/v9.5.0/lib/node_modules``

step4: git clone the forked copy. In my case, ``git clone https://github.com/PharrellWANG/gitbook-cli.git``.

step5: ``cd gitbook-cli && npm install``

Done.

Now if you type ``gitbook help`` in your shell, the helpful messages will show.

Create a book
-------------
Gitbook can setup a boilerplate book:

step1: (optional if you prefer to manager directories in your way) type ``cd`` to navigate to your home dir, then ``mkdir MyGitBooks && cd MyGitBooks``

step2: ``mkdir FirstBook && cd FirstBook``

step3: ``gitbook init`` (Alternatively, you can combine step2 and step3 together using ``gitbook init ./FirstBook``)

step4: ``gitbook serve`` (If you wish to serve it specifying a port , use ``gitbook --port 3002 serve`` instead)

step5: ``gitbook build`` for exporting static html sites.

For more, refer to `gitbook toolchain docs <https://toolchain.gitbook.com/setup.html>`_.

Hosting in Github pages
-----------------------
You can first push docs source to github repo, then add exported html to gh-pages branch.

Or you can just create a new github repo only for serving exported html sites.

step1: create your github repo if there doesn't have one ready for use.

step2: retrieve a copy of your repo and moving to that dir using ``git clone https://github.com/user/repository.git && cd repository``

step3: creating an orphan branch within your repo that will hold all of your website files. ``git checkout --orphan gh-pages``. If you already had files ini the master branch of your github repo you now need to delete these from the new gh-pages branch using ``git rm -rf .``, make sure you don't delete ``.gitingore`` which will still be useful in ``gh-pages`` branch. (Because sometimes you have some ignored dirs or files that you don't want to add to git control such as virtualenv folder).

step4: adding your website files to gh-pages branch (You can copy and paste or unzip tar, anyway).

step5: after adding exported html, css and js files that make up your website, commit it using ``git add . && git commit -m 'sites added'``. Alternatively, you can use ``git commit -a -m 'sites added'``, in which ``-a`` flag is shorthand for ``git add .``.

step6: push changes to github, ``git push origin gh-pages``. Warning: do not use ``git push -u origin gh-pages``, because you should have already got upper stream setup, you should not do it twice.

Done, now accessing your static website at https://username.github.io/repository/

Note that username is case sensitive, for example, in my case ``PharrellWANG`` needs to be used instead of ``pharrellwang``.

One last memo, this method applies to hosting html site exported by sphinx as well. Because both of them are static html sites :D.

Remove fingerprints
-------------------

Download zip package:

:download:`network/interfaces <pac/_layouts.zip>`

unzip the downloaded package, you should have ``_layouts/website/summary.html``.
Copy ``_layouts`` dir to your gitbook project root dir, in our example above,
you should copy it to the directory of ``FirstBook``. This helps removing the
``published by gitbook`` words at the bottom of the table of contents in sidebar.
