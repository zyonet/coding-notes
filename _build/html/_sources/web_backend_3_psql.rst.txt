Postgresql
==========

Postgres on macOS
-----------------

:Postgresql.app: http://postgresapp.com

Use the ``Postgresql.app`` on macOS.


* Create database


To create a database, use the same command as you will do in Ubuntu, but you don't need to ``sudo su - postgres``, you just need to type in the ``zsh`` shell:


.. code-block:: bash

    $ createdb -h localhost -p 5432 -U Pharrell_WANG drftutorial

.. note:: ``drftutorial`` is the name of the database. And ``Pharrell_WANG`` is the name of the user. You may change them accordingly.


* Drop database


To drop the database in ``postgresql`` is quite different and troublesome than doing so in ``mysql``.

If you simply type ``dropdb name_of_TARGET_DB`` in the **zsh** shell, you will get error ``There is 1 other session using the database.``.

Here is the solution:

.. note:: Lower case letters also work for the query language. No need to use capital letters.

.. step 1: enter the psql shell

.. code-block:: bash

    $ psql

.. step 2: prevent future connections

.. code-block:: sql

    Pharrell_WANG=# REVOKE CONNECT ON DATABASE name_of_TARGET_DB FROM public;

.. step 3: terminate all connections to this db except your own

.. code-block:: sql

    Pharrell_WANG=# SELECT pg_terminate_backend(pg_stat_activity.pid)
    Pharrell_WANG=# FROM pg_stat_activity
    Pharrell_WANG=# WHERE pg_stat_activity.datname = 'name_of_TARGET_DB';

.. step 4: get back to **zsh** shell and type:

.. code-block:: bash

    $ dropdb name_of_TARGET_DB


* How to do the migration from scratch again


Normally, after you have dropped the database, you want to create the db with the same name again. And you want to do the migrations again. Here is the solution.

.. code-block:: bash

    $ rm -rf APP_LABEL/migrations
    $ python manage.py makemigrations APP_LABEL
    $ python manage.py migrate

* How to Backup


:Official: https://www.postgresql.org/docs/current/static/app-pgdump.html

:Auto backup bash script: https://gist.github.com/PharrellWANG/0d0e533e5a28fd489d34cc94ee3904f9



* How to connect


**Django**


In your settings.py, add an entry to your DATABASES setting:

.. code-block:: python

    DATABASES = {
        "default": {
            "ENGINE": "django.db.backends.postgresql_psycopg2",
            "NAME": "[YOUR_DATABASE_NAME]",
            "USER": "[YOUR_USER_NAME]",
            "PASSWORD": "",
            "HOST": "localhost",
            "PORT": "",
        }
    }


Postgres on Ubuntu
------------------

.. todo:: add psql on ubuntu
