Python
======

This section has some python memos.

Get information of what Pythons that you have on your linux
-----------------------------------------------------------

If we assume that a Python binary is always going to be called ``python<something>`` and be a binary file, we can just search the entire system for files that match those criteria:


.. code-block:: bash

    $ sudo find / -type f -executable -iname 'python*' -exec file -i '{}' \; | awk -F: '/x-executable; charset=binary/ {print $1}' | xargs readlink -f | sort -u | xargs -I % sh -c 'echo -n "%: "; % -V'



Install Python3.6 on Ubuntu 16.04 from source
---------------------------------------------

``step1``: First we need to install some dependencies using the commands below:

.. code-block:: bash

    $ sudo apt install build-essential checkinstall
    $ sudo apt install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

``step2``: Download python3.6.1 source code (XZ compressed source tarball) from

:python org: https://www.python.org/downloads/release/python-361/

.. code-block:: bash

    $ wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz

``step3``: Extract the tarball.

.. code-block:: bash

    $ tar xvf Python-3.6.1.tar.xz

``step4``: cd into the source directory, configure the build environment and install.

.. note:: If you want a release build with all optimizations active (LTO, PGO, etc), please run ``./configure --enable-optimizations`` instead of ``./configure``.

.. code-block:: bash

    $ cd Python-3.6.1/
    $ ./configure --enable-optimizations
    $ sudo make altinstall


``make altinstall`` command skips creating symlink, so /usr/bin/python still points to the old version of Python and your Ubuntu system won't break.

Once that's done, you can use Python3.6 shell by typing the following commands:

.. code-block:: bash

    $ python3.6


Install venv with python version specified
------------------------------------------

.. code-block:: bash

    $ sudo apt install virtualenv
    $ virtualenv venv --system-site-packages -p `which python3.6`

1. ``venv`` is the target directory name.
2. ``--system-site-packages`` is for inheriting the system site packages (normally it has no harm, hence it is suggested. Unless you want a super clean python venv)


.. note:: pip will already be installed if you're working in a ``Virtual Environment`` created by ``virtualenv`` or ``pyvenv``. So after you install python from source, no need to worry about how to install the corresponding pip, you just need to start a virtual env.


Mixin
-----

A mixin is a special kind of **multiple inheritance**.

Mixin is all about DRY. Since it allows us to easily compose reusable bits of behaviours.

There are two main situations where mixins are used:

    1. You want to provide a lot of optional features for a class.
    2. You want to use one particular feature in a lot of different classes.

Find current directory and file's directory
-------------------------------------------

.. code-block:: python

    import os

    print("Path at terminal when executing this file")
    print(os.getcwd() + "\n")

    print("This file path, relative to os.getcwd()")
    print(__file__ + "\n")

    print("This file full path (following symlinks)")
    full_path = os.path.realpath(__file__)
    print(full_path + "\n")

    print("This file directory and name")
    path, filename = os.path.split(full_path)
    print(path + ' --> ' + filename + "\n")

    print("This file directory only")
    print(os.path.dirname(full_path))



Print the Python Exception
--------------------------

Python2:


.. code-block:: python

    try:
        ...
    except Exception, e:
        print(str(e))


Python3:

.. code-block:: python

    try:
        ...
    except BaseException as e:
        print(str(e))


.. tip:: For using ``ObejctDoesNotExist``, we needs to import it first. See below.

.. code-block:: python

    from django.core.exceptions import ObjectDoesNotExist
    try:
        ...
    except ObjectDoesNotExist:
        ...



Get all attributes of a python object
-------------------------------------

It is very simple but powerful, just use the build-in function of ``dir``::

    >>> print(dir(<your-python-obj-here>)



.. _python-assertions-label:

Python Assertions
-----------------
The TestCase class provides several assert methods to check for and report failures. The following table lists the most commonly used methods::

    ==========================  ========================== ======
    Method                           Checks that                    New in
    ==========================  ========================== ======
    assertEqual(a, b)                   a == b
    assertNotEqual(a, b)                a != b

    assertTrue(x)                       bool(x) is True
    assertFalse(x)                      bool(x) is False

    assertIs(a, b)                      a is b                      3.1
    assertIsNot(a, b)                   a is not b                  3.1

    assertIsNone(x)                     x is None                   3.1
    assertIsNotNone(x)                  x is not None               3.1

    assertIn(a, b)                      a in b                      3.1
    assertNotIn(a, b)                   a not in b                  3.1

    assertIsInstance(a, b)              isInstance(a, b)            3.2
    assertNotIsInstance(a, b)           not isinstance(a, b)        3.2

    assertAlmostEqual(a, b)             round(a-b, 7) == 0
    assertNotAlmostEqual(a, b)          round(a-b, 7) != 0

    assertGreater(a, b)                 a > b                       3.1
    assertGreaterEqual(a, b)            a >= b                      3.1

    assertLess(a, b)                    a < b                       3.1
    assertLessEqual(a, b)               a <= b                      3.1

    assertRegex(s, r)                   r.search(s)                 3.1
    assertNotRegex(s, r)                not r.search(s)             3.2

    assertCountEqual(a, b)              *a* and *b* have the        3.2
                                        same elements in the
                                        same number, regardless
                                        of their order


Ref:

:Install python # 1: https://www.linuxbabe.com/ubuntu/install-python-3-6-ubuntu-16-04-16-10-17-04

:Install python # 2: https://pip.pypa.io/en/stable/installing/

:Mixin: https://stackoverflow.com/questions/533631/what-is-a-mixin-and-why-are-they-useful

How to get Username HomeDirectory Hostname in python
----------------------------------------------------

Get Username
^^^^^^^^^^^^
User ``getpass.getuser``

.. code-block:: python

    import getpass
    username = getpass.getuser()
    print username


Get Home Directory
^^^^^^^^^^^^^^^^^^
User ``os.environ``

.. code-block:: python

    import os
    homedir = os.environ['HOME']
    print homedir


Get hostname
^^^^^^^^^^^^
Use ``socket.gethostname``

.. code-block:: python

    import socket
    hostname = socket.gethostname()
    print hostname



How to round up float number
----------------------------

.. code-block:: python

    import math
    print math.ceil(4.2)

Use the ceil function to round up float number. Very convenient.

How to Exit Python Scripts
--------------------------

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
