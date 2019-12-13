PGP
===

What is it
----------

.. note:: 

    1. GPG: GNU Privacy Guard, also known as GnuPG, command line tool, a complete and free implementation of the OpenPGP standard as defined by RFC4880, also known as PGP (Pretty Good Privacy). GPG, also known as GnuPG, is a command line tool with features for easy integration with other applications.
    2. PGP: Pretty Good Privacy encryption, a data encryption computer program that gives cryptographic privacy and authentication for online communication.

Advantages and Application Scenarios
------------------------------------


Get Started
-----------

Below are common gpg terminal commands.

.. code-block:: bash

    # export public and private keys
    gpg --list-keys
    gpg --list-secret-keys

    gpg --export-secret-keys $ID > my-private-key.asc

    # import keys
    gpg --import my-private-key.asc

    # delete keys
    gpg --delete-keys
    gpg --delete-secret-keys




References
----------

1. `Introduction to PGP encryption and decryption <https://developer.rackspace.com/blog/introduction-to-pgp-encryption-and-decryption/>`_

2. `How to use GPG to encrypt stuff <https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff.html>`_

