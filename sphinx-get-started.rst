Sphinx Get Started
==================

``Sphinx notes`` is the MEMO for using Sphinx to write the docs.


Installation
------------

.. tip:: `Pycharm` is suggested. You can choose the interpreter and make version control more convenient than using a text editor.

Make environment with pip::

    $ pip install sphinx sphinx-autobuild

Create a directory inside your project to hold your docs (or simply start a dedicated directory):

.. code-block:: bash

    $ cd /path/to/project
    $ mkdir docs

Run ``sphinx-quickstart`` in there:

.. code-block:: bash

    $ cd docs
    $ sphinx-quickstart

This quickstart will walk you through creating the basic configuration;
In most cases, you can just accept the defaults;
When it is done, you will have an ``index.rst``, a ``conf.py`` and some other files.
Add these to version control.

Choose your theme
-----------------

Visit the link to choose a theme for your project.

:awesome-sphinx: https://github.com/yoloseem/awesome-sphinxdoc

.. Tip:: `rtd`, `basicstrap` and `better theme` are recommended.

1. `RTD` is recommended.

    :rtd: https://github.com/rtfd/sphinx_rtd_theme

.. note:: When using ``rtd`` theme, remember to add ``fonts`` folder within ``_static`` folder. And inside ``fonts`` folder, please add ``fontawesome-webfont.woff2`` to avoid `404 font not found`.


2. `Basicstrap style theme sample for Sphinx` is also good.

    :Basicstrap: https://pythonhosted.org/sphinxjp.themes.basicstrap/index.html

.. warning:: ``search`` function is not working in ``basicstrap`` theme though it has a nice look.


3. `sphinx-better-theme` is mainly using the css. Clean and responsive.

    :better theme: http://sphinx-better-theme.readthedocs.io/en/latest/

Edit your docs
--------------

Here is a nice tuto:

:tuto: https://pythonhosted.org/an_example_pypi_project/sphinx.html

Now edit your index.rst and add some info about your project.

Here's some online Tutorials/Documentations on how to write .rst files for sphinx.

:reStructuredText Primer: http://www.sphinx-doc.org/en/stable/rest.html#rst-primer
:Sphinx Markup Constructs: http://www.sphinx-doc.org/en/stable/markup/index.html#sphinxmarkup

Also, you can download the rtd repo, to learn the .rst by comparing the live doc view with the source:

:docs view: http://docs.readthedocs.io/en/latest/getting_started.html#in-restructuredtext

:source repo: https://github.com/rtfd/readthedocs.org/tree/master/docs

View your docs
--------------

To view your docs, you need to build them first

.. code-block:: bash

    $ make html

To see how they look in browsers

1. Use the ``serve`` to see how they look
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

:'serve' repo: https://github.com/zeit/serve

``step 1`` install ``serve``

.. code-block:: bash

    $ npm install -g serve

``step 2`` simple commands, refresh your memory:

For serving the single page react-redux app (remember to add the -s flag, otherwise the react-router won't work).

.. code-block:: bash

			$ serve -s ./dist

For auth:

.. code-block:: bash

            $ SERVE_USER=zwap SERVE_PASSWORD=123123AA serve --auth _build/html -p 5555

``step 3`` use serve:

.. code-block:: bash

    $ serve ./_build/html -p 5555

.. note:: You can use ``sphinx-autobuild`` to auto-reload your docs. Run ``sphinx-autobuild . _build_html`` instead, see below.

2. Use ``sphinx-autobuild``
^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is meant to be used like the concept of **hot-reloading** from web
app development. You can view real time updates when you editing source codes
for your documents.

.. code-block:: bash

    $ sphinx-autobuild . _build_html
    # Now view your docs at http://127.0.0.1:8000


Moreover, you can specify a port like below

.. code-block:: bash

    $ sphinx-autobuild -p 9989 -H localhost . _build_html
    # Now view your docs at http://localhost:9989


Spelling Check
--------------

:spelling: https://pypi.python.org/pypi/sphinxcontrib-spelling/
:spelling docs: http://sphinxcontrib-spelling.readthedocs.io/en/latest/

:pyenchant: https://pypi.python.org/pypi/pyenchant/ (which requires ``enchant``)
:pyenchant docs: http://pythonhosted.org/pyenchant/

:enchant: https://www.abisource.com/projects/enchant/
