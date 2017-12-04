Ubuntu
======

Check Version
-------------

The below terminal command can help you check the ubuntu release version.

.. code-block:: bash

    $ lsb_release -a


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


How to Exit Python Scripts
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. caution:: Be arefule of **endless** python loop!!


To avoid the scripts enter the endless loop, please pay attention when using the keywords of ``while`` ``continue``.
Like the codes below,
1. If the investment amount keeps insufficient, the while loop will be endless.
2. Then if you are using ``crontab`` scheduling this to run every minute, then your computing resources will fully consumed/occupied, that will be a problem, slow your server down.


.. code-block:: python

        with transaction.atomic():
                black_list = []
                Flag = True
                ######## without the block below, you might get into endless loop###################
                var_x = 0
                for inv in invs_dict[prod.id]:
                    if inv.usable_amount > 2500:
                        var_x += inv.usable_amount
                if var_x < amount2collect:
                    print('need more matchable amount')
                    if TELE_PROD:
                        msg_sending = tm.TelegramMsg(idr='-193798035',
                                                     m='We need more investments from lenders since we don\'t have sufficient money for disbursing ' + str(
                                                         bor.ref_num))
                    else:
                        msg_sending = tm.TelegramMsg(idr='-202467590',
                                                     m='We need more investments from lenders since we don\'t have sufficient money for disbursing ' + str(
                                                         bor.ref_num))
                    msg_sending.send_msg_to_notification_group()
                    break
                ######## without the block above, you might get into endless loop###################
                while Flag:
                    if amount2collect == 0:
                        break
                    random_inv = random.choice(invs_dict[prod.id])
                    if random_inv.usable_amount <= 2500:
                        continue

* to stop a python script just press ``Ctrl + c``
* inside a script with ``exit()``
* you can do it in an interactive script with just exit
* you can use ``pkill -f name-of-the-python-script``

But be aware, if your script stepped into an endless loop, and you are using crontab scheduling it, then all the four methods are not applicable, even the second one which is using ``exit()`` since your script can never get into ``exit()``.
