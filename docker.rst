Docker
======

Concepts
--------

#. ``Docker`` is a platform for developers and sysadmins to develop, deploy and run applications with containers.
#. The use of Linux containers to deploy applications is called ``containerization``.
#. An ``image`` is an executable package that includes everything needed to run an application - the code, a runtime, libraries, environment variables, and configuration files.
#. A ``container`` is launched by running an ``image``.
#. A ``container`` is a runtime instance of an ``image`` - what the image becomes when executed (that is an image with state, or a user process).
#. Portable ``images`` (which ensure your app, its dependencies and the runtime, all travel together,) are defined by something called a ``Dockerfile``.
#. In a distributed application, different pieces of the app are called ``services``. Services are really just *containers in production*. To define, run and scale services with the Docker platform, write a ``docker-compose.yml`` file.
#. A **single service stack** can run **5 container instances** of our **deployed image** on one host.
#. A **single container** running in a **service** is called a ``task``.

Docker App Hierarchy
--------------------

* Stack
* Services
* Container

If you build an app the Docker way, at the bottom of the hierarchy of such an app is a ``container``.
Above this level is a ``service``, which defines how the containers behave in production. Finally, at
the top level is the ``stack``, defining the interactions of all ``services``.

Commands
--------

#. ``docker --version`` : see docker version.
#. ``docker info`` or ``docker version`` (without ``--``) : see more info about your docker installation.
#. ``docker image ls`` or ``docker images`` : list all the images.
#. ``docker container ls`` : list all the running containers.
#. ``docker container ls --all`` : list all the containers, including those exited after running.
#. ``docker container ls -aq`` : list docker containers, all in quiet mode.
#. ``docker container COMMAND`` : manage containers.
#. ``docker ps -as`` : list (all) containers (with sizes).
#. ``sudo service docker restart`` : restart docker service on Linux.
#. ``docker run -p 4000:80 IMAGE-NAME`` : run docker with *port remapping*, 4000 is the host port, 80 is service port.
#. ``docker tag friendlyhello pharrellwang/get-started:part2`` : associate a local image named ``friendlyhello`` with a repository named ``pharrellwang/friendlyhello:part2`` on a registry. The tag is optional, but recommended for the registry to give Docker images a version.
#. ``docker push pharrellwang/get-started:part2`` : publish the image by uploading your tagged image to the repository. Once complete, the result of this upload are publicly available.
#. ``docker run -p 4000:80 pharrellwang/get-started:part2``: pull and run the image from the remote repository. (If the image is not available locally, docker pulls it from the remote repository.)


Swarm
~~~~~
#. ``docker swarm init`` : initialize Swarm, make current node a manager.
#. ``docker stack deploy -c docker-compose.yml getstartedlab`` : run the load-balanced app, ``getstartedlab`` is the app name given by you
#. ``docker service ls`` : list running services associated with an app.
#. ``docker service ps getstartedlab_web`` : list tasks associated with an app. ``getstartedlab_web`` is the name obtained from the service name prepended by app name.
#. ``docker container ls -q`` : tasks also show up if you just list all the containers on your system, though that is not filtered by service.
#. ``docker stack rm getstartedlab`` : take the app down.
#. ``docker swarm leave --force`` : take down the swarm.
#. ``docker inspect <task or container>`` : inspect task or container.

Copy
~~~~

Copy to container
^^^^^^^^^^^^^^^^^
One specific file can be copied like:
First ``cd`` to the directory, in which the file/folder to be copied resides. Then,

#. ``docker cp foo.txt [container-id]:/foo.txt`` : copy file from host to container (Docker version must be ``>= 1.8``).
#. ``docker cp [container-id]:/foo.txt foo.txt`` : copy file from container to host.

Multiple files contained by the folder ``src`` can be copied into the ``target`` folder using:

#. ``docker cp src/. [container-id]:/target``
#. ``docker cp [container-id]:/src/. target``

Copy file to a named volume
^^^^^^^^^^^^^^^^^^^^^^^^^^^

You need to mount the volume to a container, then use ``docker cp``.
The process is exactly like copying to container itself.

.. code-block:: bash

    $ docker container create --name dummy -v myvolume:/root hello-world
    $ docker cp c:\myfolder\myfile.txt dummy:/root/myfile.txt
    $ docker rm dummy

    # More Example:
    # use below comand to copy video sequences to mounted docker volume,
    # suppose you used below command to mount the volume,
    # $ docker run -it -v videoseq:/home/devuser/videoseq -v codecio:/home/devuser/codecio pharrellwang/docker-env-for-intragan:1.0.2
    # then from docker host,
    # zxpwang2@ubt16b:/public/zxpwang2
    $ docker cp videoseq/ClassC quirky_hodgkin:/home/devuser/videoseq/
    # ``ClassC/`` will appear under ``/home/devuser/videoseq/``,
    # i.e., ``/home/devuser/videoseq/ClassC/``
    # replace container name ``quirky_hodgkin`` if you are using another container.


Build image
~~~~~~~~~~~

.. code-block:: bash

    $ docker build --rm -f <dockerfile> -t <container tag> .
    # for example:
    $ docker build --rm -f ubuntu14.04-cmake-3.5.1 -t matrim/cmake-examples:3.5.1 .

Note the dot at the end of the command.

Enter a running container
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    $ sudo docker attach 665b4a1e17b6 #by ID
    or
    $ sudo docker attach loving_heisenberg #by Name
    $ root@665b4a1e17b6:/#

From docker v1.3, if we use ``attach`` we can use only one instance of the shell. So if
we want to open a new terminal with a new instance of a container's shell, just run the following:

.. code-block:: bash

    $ docker exec -it [container-id or container-name] /bin/bash


Start exited container
~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    $ docker start -a -i `docker ps -q -l`

Explanation:

* ``docker start`` : start a container using name or ID.
* ``-a`` attach to container.
* ``-i`` interactive mode.
* ``docker ps`` list containers.
* ``-q`` list only container ID.
* ``-l`` list only last created container.

Commit changes in a container to a docker image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
First exit container, then

.. code-block:: bash

    $ docker commit -m 'what you have done to the image' -a 'Author name' [container-id] repository/new_image_name:tag
    $ docker push repository/new_image_name:tag

Create and manage volumes
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    $ docker volume create my-vol
    $ docker volume ls
    $ docker volume inspect my-vol

Run a container with volumes from image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All options for *volumes* are available for both ``--mount`` and ``-v`` flags.
When using volumes with services, only ``--mount`` is supported.

.. code-block:: bash

    # use ``--mount``
    $ docker run -it --mount source=videoseq,destination=/home/devuser/videoseq --mount source=codecio,destination=/home/devuser/codecio pharrellwang/docker-env-for-intragan:1.0.2
    # use ``-v``
    $ docker run -it -v videoseq:/home/devuser/videoseq -v codecio:/home/devuser/codecio pharrellwang/docker-env-for-intragan:1.0.2


List the content of a named volume in docker 1.9+
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    $ docker run --rm -i -v=postgres-data:/tmp/myvolume busybox find /tmp/myvolume


Explanation: Create a minimal container with tools to see the volume's files (busybox), mount
the named volume on a container's directory (``v=postgres-data:/tmp/myvolume``), list the volume's
files (``find /tmp/myvolume``). Remove the container when the listing is done (``--rm``).

Frequently Used
~~~~~~~~~~~~~~~

* ``docker images`` : list all the images.
* ``docker ps`` : list running containers.
* ``docker ps -as`` : list all the containers, including those exited after running.

FAQs for newbies
----------------
1. What is the usage of ``-it`` in ``docker run -it username/image:tag``?

A quick answer is -- It basically makes the container start look like a terminal connection
session. And this is typically what you want.

2.
