nginx
=====

Introduction
------------
`nginx <https://nginx.org/en/>`_ [engine x] is
an HTTP and reverse proxy server,
a mail proxy server, and
a generic TCP/UDP proxy server.

Installation
------------

macOS
~~~~~
Simply install nginx using **Homebrew**: ``brew install nginx``.

After installation, run nginx: ``sudo nginx``.

Open browser, navigate to http://localhost:8080 , and you should be able to see a welcome page.


Configuration
-------------

macOS
~~~~~
The default location of ``nginx.conf`` on macOS after installing with brew:

.. code-block:: bash

    /usr/local/etc/nginx/nginx.conf

Example conf files: ``/Users/pharrell/Documents/NginxConfigurations``.


File locations
--------------

macOS
~~~~~
* conf file: ``/usr/local/etc/nginx/nginx.conf``

* default error log: ``/usr/local/var/log/nginx/*``

* default nginx html folder (brew install only): ``/usr/local/Cellar/nginx/1.2.3/html`` (change **1.2.3** to your nginx version, use ``nginx -v`` to check version)

.. note:: Actually ``/usr/local/Cellar/nginx/1.2.3/html`` folder links to ``/usr/local/var/www``

Signals
-------

* ``sudo nginx -s stop``
* ``sudo nginx -s quit``
* ``sudo nginx -s reopen``
* ``sudo nginx -s reload``

For help: ``nginx -h``






