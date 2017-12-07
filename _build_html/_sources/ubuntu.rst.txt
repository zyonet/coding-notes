Ubuntu
======

Check Version
-------------

The below terminal command can help you check the ubuntu release version.

.. code-block:: bash

    $ lsb_release -a


Check disk space
~~~~~~~~~~~~~~~~

type `df -h` in terminal


cat in Ubuntu
-------------

:ref: https://www.tecmint.com/13-basic-cat-command-examples-in-linux/

Use ``cat`` to get the contents into a txt file.

.. code-block:: bash

    $ sudo cat /etc/network/interfaces > /tmp/net.txt


How to set static ip address for ubuntu server 16.4 and do port forwarding
--------------------------------------------------------------------------

Find an existing vm ubuntu server, use the ``net.txt`` that you get from the above step.
And type the contents in that ``net.txt`` file to the ``/etc/network/interfaces``. **Then shutdown the vm, refresh the mac address** for several times.

At this time you can ask the network administrator to help do the port forwarding.

You need to provide:

1. static ip: e.g., 192.168.0.157 (maybe mac address also needed)
2. local port 8080 mapping to the public port 8080 [or other ports]


How to enable remote ssh
------------------------

:ref: https://help.ubuntu.com/lts/serverguide/openssh-server.html
:ref: https://help.ubuntu.com/community/SSH/OpenSSH/Configuring

**Remember to change the network adapter to ``Bridged`` instead of ``NAT``.**

If you want quick remote access using password only:

.. code-block:: bash

    $ sudo nano /etc/ssh/sshd_config

Then uncomment this line of codes::

    #PasswordAuthentication yes


Then restart ssh::

    $ sudo restart ssh

If you get the error, "Unable to connect to Upstart", restart ssh with the following::

    $ sudo systemctl restart ssh


If you want to use key pair auth, please refer to links above.


Configuring Iptables on Ubuntu 14.04
------------------------------------

:ref: https://www.upcloud.com/support/configuring-iptables-on-ubuntu-14-04/

Save
~~~~

.. code-block:: bash

    $ sudo iptables-save > /etc/iptables/rules.v4

Restore
~~~~~~~

* Overwrite the current one

.. code-block:: bash

    $ sudo iptables-restore < /etc/iptables/rules.v4


* Add the new rules while keeping the current one


.. code-block:: bash

    $ sudo iptables-restore -n < /etc/iptables/rules.v4

Apply
~~~~~
.. code-block:: bash

    $ sudo iptables-apply iptables.txt


Persistent Iptables
~~~~~~~~~~~~~~~~~~~

You can automate the restore process at the reboot by installing an  additional package for iptables which takes over the loading of the saved rules.

.. code-block:: bash

    $ sudo apt-get install iptables-persistent


After the installation the initial setup will ask to save the current rules for IPv4 and IPv6, just select Yes and press enter for both.
If you make further changes to your iptables rules, remember to save them again using the same command as above. The iptables-persistent looks for the files rules.v4 and rules.v6 under /etc/iptables.


How to solve the issue of Filezilla permission denied
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To allow user ``ubuntu`` write access to the remote root directory, enter those commands via terminals as root user ``sudo``:

.. code-block:: bash

    $ sudo chown -R ubuntu /etc/supervisor
    # make sure permissions on that entire folder were correct:
    $ sudo chmod -R 755 /etc/supervisor


tar compress
------------

Basics
~~~~~~

**compress**

.. code-block:: bash

    $ cd /path/to/the/folder/directory
    # e.g., if you want to compress folder of `myProj`, its path is `/home/ubuntu/myProj`, then you need to $ cd /home/ubuntu
    #
    $ tar -zcvf name-of-archive.tar.gz foldername
    # e.g., $ tar -zcvf myProj.tar.gz myproj
    # the compressed tar ball will be in the /home/ubuntu/ directory
    #
    $ tar -zcvf /tmp/myProj.tar.gz foldername
    # the compressed tar ball will be in the /tmp/ directory

**extract**
.. code-block:: bash

    $ tar -zxvf -C archive.tar.gz

Notice that it must be a capital letter c.

If you want to extract files to a specified directry, you can use: `$ tar -zxvf archive.tar.gz -C /tmp`

Advanced
~~~~~~~~
Exclude files matching patterns listed in `exclude.txt`

.. code-block:: bash

    $ touch exclude.txt
    $ vim exclude.txt
    # press I button and type somthing
    # press esc button and : button, then type x, then press enter to save and exit vim
    # the file will be something like:
    #
    # abc
    # xyz
    # *.bak
    # backup2017*.sql
    #

    $ tar -zcvf /tmp/mybak.tar.gz -X exclude.txt /home/me


Download/Upload files from/to server
------------------------------------
.. code-block:: bash

    # download: remote -> local
    scp user@remote_host:remote_file local_file
    # upload: local -> remote
    scp local_file user@remote_host:remote_file
