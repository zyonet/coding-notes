Ubuntu
======

Utilities
---------

rsync
~~~~~

.. note:: rsync -- a fast, versatile, remote (and local) file-copying tool

Example usage:

**Usage #1**: Use ``rsync`` to *locally* copy folders and optionally omit some files/folders.

.. code-block:: bash

    $ rsync -av --progress HM HM-COPY --exclude *.yuv --exclude *.bin --exclude *.cfg --exclude cfg
    $ rsync -av --progress HM HM-COPY --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"}

Explain:

1. ``-v`` means `` -v, --verbose               increase verbosity``

2. ``-a`` is the archive mode, it includes lots of modes, see `here <https://superuser.com/questions/1322108/when-is-av-not-the-appropriate-option-for-rsync>`_ for more.

3. **HM** is the source folder.

4. **HM-COPY** is the destination folder, if it does not exist, it will be created.

5. If we do not specify the full path, **HM-COPY** will be created in the current working directory.

6. You can use ``--exclude`` multiple times, you can also just use it once.

**Usage #2**: Use ``rsync`` to *remotely* push/pull files/folders.

.. code-block:: bash

    $ rsync -av --progress <user-name>@<host-ip>:/home/<user-name>/<folder-to-copy> /Users/<user-name>/Downloads

<folder-to-copy> will be copied to ``Downloads`` folder.

See `rsync manual page <https://linux.die.net/man/1/rsync>`_.


Check Version
-------------

The below terminal command can help you check the ubuntu release version.

.. code-block:: bash

    $ lsb_release -a


Check disk space
~~~~~~~~~~~~~~~~


1. type `df -h` in terminal

2. check a folder

.. code-block:: bash

        $ du -h /usr/local/texlive/2016/


Install latex on ubuntu
-----------------------

``sudo apt-get install texlive-full``



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

An example provided for downloading:

:download:`network/interfaces <_static/downloads/net.txt>`

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

Permission denied (publickey)
-----------------------------

for ssh
~~~~~~~
If you see a warning like ``Permission denied (publickey)``, try to supply
private key.

.. code-block:: bash

    $ ssh root@www.mywebsite.com
    # Permission denied (publickey).

    $ ssh -i ~/.ssh/my_private_key root@www.mywebsite.com
    # success!

Or if you can configure ``~/.ssh/config`` file, based on your configuration,
you can directly type ``ssh mywebsite``.

for git pull
~~~~~~~~~~~~

:ref: https://confluence.atlassian.com/bitbucket/troubleshoot-ssh-issues-271943403.html

if you see ``Permission denied(publickey)`` when doing git pull,
please first type

.. code-block:: bash

    $ eval `ssh-agent`

in the terminal to
start `ssh agent <https://linux.die.net/man/1/ssh-agent>`_,
which is the authentication agent.

Then you can use ``ssh-add ~/.ssh/<private_key_file>`` to add your keys.

ssh-add
-------

`Could not open a connection to your authentication agent <https://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent>`_

If you cannot successfully perform ``ssh-add``, you can do this:

.. code-block:: bash

    $ eval `ssh-agent -s`
    $ ssh-add


what is the eval command in bash
--------------------------------

ref: `What is the “eval” command in bash? <https://unix.stackexchange.com/questions/23111/what-is-the-eval-command-in-bash>`_

eval - construct command by concatenating arguments


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

.. note:: ``iptables-apply`` shall be used with ``iptables.txt``
        while ``iptable-restore`` shall be used with ``rules.v4``
        with the symbol of ``<``.



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


Give specific user permission to write to a folder using +w notation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ref: https://askubuntu.com/questions/487527/give-specific-user-permission-to-write-to-a-folder-using-w-notation

If you want to change the user owning this file or
directory (folder), you will have to use the command
``chown``. For instance, if you run

.. code-block:: bash

    sudo chown username: myfolder/file

the user owning myfolder will be the username. Then you can execute

.. code-block:: bash

    sudo chmod u+w myfolder

to add the write permission to the username user.

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

    $ tar -zxvf archive.tar.gz

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
    $ scp user@remote_host:remote_file local_file

    # upload: local -> remote
    $ scp local_file user@remote_host:remote_file

    # ***************** Detailed Example *******************
    # ******************************************************
    #
    ### --> Download:
    #
    $ scp root@zwap:/tmp/pl.sql ~/Downloads/pl.sql
    #
    ### --> Upload:
    #
    $ scp ~/Downloads/pl.sql ubuntu@zwap_server_on_iMac:/tmp/pl.sql
    #
    #
    # ******************************************************

    # ----> example
    $ scp -i ~/.ssh/myprivatekey root@www.mywebsite.com:/home/ubuntu/example.sql /tmp/example.sql
    # if you have `~/.ssh/config` file configured
    $ scp mywebsite:/home/ubuntu/example.sql /tmp/example.sql


what is the difference between .bash_profile and .bashrc
--------------------------------------------------------

ref: `What is the difference between .bash_profile and .bashrc? <https://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc>`_

``.bash_profile`` is executed for login shells, while ``.bashrc`` is executed for interactive non-login shells.

When you login (type username and password) via console, either sitting at the machine, or remotely via ssh: .bash_profile is executed to configure your shell before the initial command prompt.

But, if you’ve already logged into your machine and open a new terminal window (xterm) then ``.bashrc`` is executed before the window command prompt. ``.bashrc`` is also run when you start a new bash instance by typing ``/bin/bash`` in a terminal.

On OS X, Terminal by default runs a login shell every time, so this is a little different to most other systems, but you can configure that in the preferences.


How to execute a bash script at system Startup/Shutdown/Reboot
--------------------------------------------------------------

:ref: http://www.upubuntu.com/2015/08/how-to-executerun-bash-script-at-system.html

1. ``chmod +x script_file`` can turn your script executable

2. if you want to run a bash script at system startup, go edit ``/etc/rc.local``

3. if you want to run a script at system reboot, go put it in ``/etc/rc0.d``

4. if you want to run a script at system shutdown, go put it in ``/etc/rc6.d``


Check the size of a folder
--------------------------

ref: https://unix.stackexchange.com/questions/185764/how-do-i-get-the-size-of-a-directory-on-the-command-line

Jump to the directory, type: ``du -sh`` and wait for results.
