Ports
=====

Kill ports
----------

Kill ports on macOS
~~~~~~~~~~~~~~~~~~~
``Step 1``
Use ``ps`` to list process activities, then get the PID (Process Identifier Number).

.. code-block:: bash

    $ ps

``Step 2``
Use ``sudo kill`` to kill the process and release the port occupied by the corresponding process.

.. code-block:: bash

    $ sudo kill <PID>

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
