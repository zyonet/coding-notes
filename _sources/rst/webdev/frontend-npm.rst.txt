NPM
===

.. tip:: Use ``$ npm ls --depth=0 > dep.txt`` to list the versions of all the npm packages

If you see errors like: **npm undate check failed, try running with sudo or get access to the local update config store via ``sudo chown -R $USER:$(id -gn $USER) /Users/zwapimachk/.config``**, just do it:

.. code-block:: bash

    $ sudo chown -R $USER:$(id -gn $USER) /Users/zwapimachk/.config


.. note:: Difference between ``npm update`` and ``npm install``: The only big difference is that **an already installed module with fuzzy versioning**

    1. gets ignored by ``npm install``
    2. gets updated by ``npm update``

.. tip:: Please make sure ``nodejs`` is the newest version!

How to remove node_modules/ and do npm install again
----------------------------------------------------

.. code-block:: bash

    $ sudo rm -rf node_modules/
    $ sudo npm cache verify --force
    $ sudo npm cache clean --force
    $ sudo npm update -g npm
    $ sudo npm install

1. If you find some packages are ``extraneous``, you can ``npm uninstall <package_name>``.
2. If you find the version of some packages are not correct, you can first uninstall them, then use ``npm install <package_name>@^<2.2.2(this is the correct version)>``. Meanwhile remember to update the package.json manually and commit push.

.. note:: For the scroll bar issue once happened Zwap frontend project, i learned:

    1. Keep ``npm`` and ``nodejs`` up-to-date!
    2. ``npm list --depth=0`` to make sure all the packages are correctly installed hence make sure dependencies are all met!
    3. Of course, if the problem is ``semantic-ui-react``, you have to adjust the css codes.

NVM Not Compatible with the NPM Config
--------------------------------------
If you see the warning message like:

.. code-block:: bash

    nvm is not compatible with the npm config "prefix" option: currently set to "/usr/local" Run "npm config delete prefix" or "nvm use --delete-prefix v6.11.1 --silent" to unset it.

**Solution**: simply delete and reset the prefix

.. code-block:: bash

    $ npm config delete prefix
    $ npm config set prefix $NVM_DIR/versions/node/v6.11.1

Note: Change the version number with the one indicated in the error message.