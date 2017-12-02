Ports
=====

Check what ports are listening on linux(ubuntu)
-----------------------------------------------

.. code-block:: bash

    $ apt-get install nmap
    $ nmap -sT -0 localhost


Kill ports
----------

Kill ports on macOS
~~~~~~~~~~~~~~~~~~~
``Step 1``
Find out the process ID (PID) which is occupying the port number (e.g., 5955) you would like to free

.. code-block:: bash

    $ sudo lsof -i :3333

``Step 2``
Kill the process which is currently using the port using its PID

.. code-block:: bash

    $ sudo kill -9 `PID`

E.g., to kill a process with PID 1234

.. code-block:: bash

    $ sudo kill 1243

Kill ports on Linux
~~~~~~~~~~~~~~~~~~~
E.g., to free port 8081:

.. code-block:: bash

    $ sudo kill `sudo lsof -t -i:8081`

Or, you can use (**some times this is much more useful than the previous one**):

.. code-block:: bash

    $ fuser -n tcp -k 8080


What is special about port 6000 on macOS
----------------------------------------

Browsers **block** certain ports, although they are not in the system port range, some of them in the ranges widely used for local web development.

:Blocked Ports: http://www-archive.mozilla.org/projects/netlib/PortBanning.html#portlist


Ref:

:nixCraft: https://www.cyberciti.biz/faq/howto-use-ps-kill-nice-killall-to-manage-processes-in-freebsd-unix/
