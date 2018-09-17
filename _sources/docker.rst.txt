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

#. ``docker swarm init`` : initialize Swarm, make current node a manager.
#. ``docker stack deploy -c docker-compose.yml getstartedlab`` : run the load-balanced app, ``getstartedlab`` is the app name given by you
#. ``docker service ls`` : list running services associated with an app.
#. ``docker service ps getstartedlab_web`` : list tasks associated with an app. ``getstartedlab_web`` is the name obtained from the service name prepended by app name.
#. ``docker container ls -q`` : tasks also show up if you just list all the containers on your system, though that is not filtered by service.

#. ``docker stack rm getstartedlab`` : take the app down.
#. ``docker swarm leave --force`` : take down the swarm.
#. ``docker inspect <task or container>`` : inspect task or container.

Frequently Used
~~~~~~~~~~~~~~~

* ``docker images`` : list all the images.
* ``docker ps`` : list running containers.
* ``docker ps -as`` : list all the containers, including those exited after running.