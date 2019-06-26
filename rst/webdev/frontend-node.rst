Node
====

How to install Nodes.js via package manager for Ubuntu
------------------------------------------------------

1. for Ubuntu
^^^^^^^^^^^^^

.. code-block:: bash

    $ curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    $ sudo apt-get install -y nodejs

2. Install build tools. To compile and install native addons from npm you may also need to install build tools
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ sudo apt-get install -y build-essential

3. Try
^^^^^^

.. code-block:: bash

    $ node

If you encounter a warning like ``node -bash: /usr/sbin/node: No such file or directory``, please type the below command:

.. code-block:: bash

    $ sudo ln -s /usr/bin/nodejs /usr/sbin/node

Try ``node`` in terminal again. It should work now.

Done installation of ``Node.js`` on ubuntu.

How to Update node
------------------

.. code-block:: bash

    $ sudo npm install -g n
    $ sudo n latest
