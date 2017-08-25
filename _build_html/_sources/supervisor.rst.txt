Supervisor
==========

Supervisor is a A Process Control System

.. note::

    1. every time when you want to restart the django project managed by supervisor, you need to ``supervisorctl`` enter interactive shell, then ``shutdown`` and confirm, then ``exit``, then ``fuser -n tcp -k <-YOUR-PORT-NUMBER->`` to free the occupied port, then ``supervisord -c /etc/supervisor/supervsor.conf``
    2. every time when you want to start supervisor, you need to specify the directory of the root configuration file for supervisor, like: ``supervisord -c /etc/supervisor/supervisor.conf``; otherwise you will get warning when starting supervisor.

Setup and Usage
---------------

1. refer to official docs of supervisor
2. refer to the conf files under Mac dir: ``~/Documents/python_supervisor_conf_files``


``STEP 1``: Enter the ``supervisorctl`` shell, shutdown ``supervisor``, type ``y`` to confirm said shutdown, and then exit the ``supervisorctl`` shell.

.. code-block:: bash

    $ supervisorctl
    > shutdown
    > exit

``STEP 2``: Free port ``3334`` for the Zwap backend. (Port 3334 will not be freed by backend the automatically; if you don't free it, after you start the supervisor,
the backend process will encounter a "fatal error"). Also need to free port ``3336`` for backend docs, port ``3335`` and ``3337`` for frontend.

.. code-block:: bash

    $ fuser -n tcp -k 3334

``STEP 3``: Start ``supervisor``, enter ``supervisorctl``, then check the status as needed.

.. code-block:: bash

    $ supervisord -c /etc/supervisor/supervisor.conf
    $ supervisorctl
    > status

Ref:

:supervisor: http://supervisord.org
