Supervisor
==========

Supervisor is a A Process Control System

.. note::

    1. every time when you want to restart the django project managed by supervisor, you need to ``supervisorctl`` enter interactive shell, then ``shutdown`` and confirm, then ``exit``, then ``fuser -n tcp -k <-YOUR-PORT-NUMBER->`` to free the occupied port, then ``supervisord -c /etc/supervisor/supervsor.conf``
    2. every time when you want to start supervisor, you need to specify the directory of the root configuration file for supervisor, like: ``supervisord -c /etc/supervisor/supervisord.conf``; otherwise you will get warning when starting supervisor.

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

    $ supervisord -c /etc/supervisor/supervisord.conf
    $ supervisorctl
    > status

How to start/stop single process
--------------------------------

.. code-block:: bash

    root@zwap:~# supervisorctl status
    peerloan_dashboard:peerloan_dashboard_00         RUNNING   pid 2743, uptime 0:03:29
    project_peerloan:project_peerloan-00             RUNNING   pid 2742, uptime 0:03:29
    zwap-e-commerce-react:zwap-e-commerce-react_00   RUNNING   pid 2986, uptime 0:02:11

    # stop a single process:
    root@zwap:~# supervisorctl stop zwap-e-commerce-react:zwap-e-commerce-react_00

    # free the port occupied by the process
    root@zwap:~# fuser -n tcp -k 3000

    # start the single process which has just been stopped
    root@zwap:~# supervisorctl start zwap-e-commerce-react:zwap-e-commerce-react_00



Ref:

:supervisor: http://supervisord.org
