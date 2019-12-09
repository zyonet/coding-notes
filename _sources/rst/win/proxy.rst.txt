Proxy
=====

To use Linux commands in Windows, one option is to use **Cygwin**.

Proxy in Cygwin
---------------

Why is Proxy Needed
~~~~~~~~~~~~~~~~~~~

When your PC is behind proxy, you need to configure proxy to be able to perform downloading action or git clone from github. This typically happens when your PC is within company intranet.

How to Set Proxy
~~~~~~~~~~~~~~~~

1. set proxy in *~/.bashrc*: add below contents into *~/.bashrc*, then ``source ~/.bashrc``.

    .. code-block:: bash

        export HTTP_PROXY=http://127.0.0.1:12639
        export HTTPS_PROXY=$HTTP_PROXY
        export FTP_PROXY=$HTTP_PROXY
        export RSYNC_PROXY=$HTTP_PROXY
        export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"                                                 

2. set proxy in **vscode**: open ``settings.json`` in **vscode**, then add below contents into it:

    .. code-block:: json

        {
            "http.proxy": "http://127.0.0.1:12639",
            "https.proxy": "http://127.0.0.1:12639",
            "http.proxyStrictSSL": false,
        }      


3. set proxy to git clone from github in pc behind a proxy:

    step 1: run ``git config --global http.proxy http://127.0.0.1:12639`` to set proxy in *.gitconfig* 

    step 2: in *~/.ssh/config*, add below contents to make ``git clone ...`` use port 443 in case your are blocked from port 22.

    .. code-block:: bash
       :linenos:

        Host github.com                           
        User git
        HostName ssh.github.com           
        Port 443
        PreferredAuthentications publickey           
        ProxyCommand /usr/bin/corkscrew.exe 127.0.0.1 12639 %h %p
        IdentityFile ~/.ssh/github_rsa

        # you may need to change proxy url and port in line 6, 
        # and if you change ``Host`` to be another name e.g. gitproxy,
        # then you may need to use ``git clone git@gitproxy:PharrellWANG/coding-notes.git`` instead of 
        # the original ``git clone git@github.com:PharrellWANG/coding-notes.git``

    step 3: `how to set ssh keys for github <https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>`_

    step 4: `testing ssh key for github <https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection>`_

How to Use Virtualenv without Downloading
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If you have not configured the proxy hence `` virtualenv venv -p `which python3` `` fails at the step of downloading pip, you can use the below trick to skip the downloading process when creating the venv:

    .. code-block:: bash
       :linenos:

        # If you just want to use a proxy, you can use ``HTTP_PROXY`` and ``HTTPS_PROXY`` in *~/.bashrc*
        # But if you want to guarantee the use of your wheels, then do this:
        mkdir -p /opt/pypi/downloads
        pushd /opt/pypi/downloads
        pip download --no-cache --proxy http://proxy:3128 setuptools wheel pip
        popd
        virtualenv --no-download --extra-search-dir /opt/pypi/downloads virtualenv

        # if you are using an index URL (like Nexus3), you should try a similar approach.
        mkdir -p /opt/pypi/downloads
        pushd /opt/pypi/downloads
        pip download --no-cache --proxy http://127.0.0.1:12639 -i http://nexus3:8081/repository/pypi/simple --trusted-host nexus3 setuptools wheel pip
        popd
        virtualenv --no-download --extra-search-dir /opt/pypi/downloads virtualenv


Download using Proxy
--------------------

When attempting to download files/packages in cygwin on Windows desktop provided by company, in which typically the internet is only accessible via wired network, the proxy is needed for downloading to work.

.. code-block:: bash
   :linenos:

   # warning: if you want to install pip on cygwin, please use cygwin installer. Do not use below method, currently I don't think it works fine with little effort.
   curl --proxy http://127.0.0.1:12639 https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   python get-pip.py --proxy="http://127.0.0.1:12639"
   pip3 --proxy http://127.0.0.1:12639 install virtualenv
   

Common Questions
----------------

:green:`1.` :bold:`When to add commands to` :bolditalic:`.bashrc` :bold:`when to` :bolditalic:`.bash_profile`?

    You choose whether a command goes in *.bashrc* vs *.bash_profile* depending on on whether you want it to run once when ``bash --login`` or for every interactive shell start ``bash``.

    The purpose of a *.bashrc* file is to provide a place where you can set up variables, functions and aliases, define your (PS1) prompt and define other settings that you want to use every time you open a new terminal window. It serves to define elements that are not inherited through the environment, such as aliases. 

    The purpose of a *.profile* or *.bash_profile* file is to define and export environment variables and bash functions that will be used by bash and the programs invoked by bash. It is a good place to redefine PATH if needed. 

    *.bash_profile* and *.profile* which are only run at the start of a new login shell. (``bash -l`` or ``bash --login``).

    *.bashrc* is similar to *.profile* but is executed each time an interactive bash shell is launched. 
    
    If you do not use login shells, you may want to put the contents of *.profile* as discussed above instead.

    On OS X, Terminal by default runs a login shell every time.

    ref: https://cygwin.com/cygwin-ug-net/setup-files.html


:green:`2.` :bold:`What does` ``source`` :bold:`do`?

    ``source`` is a bash shell build-in command that executes the content of the file passed as argument, **in the current shell**. It has a synonym in ``.`` (period).

    So ``. ./g.sh`` is equivalent to ``source ./g.sh``

    **Syntax**

    .. code-block:: bash
       :linenos:

        . filename [args]
        source filename [args]

    .. warning::
    
        Be careful, ``./`` and ``source`` are not quite the same.
    
        * ``./script`` runs the script as an executable file, launching **a new shell** to run it.
    
        * ``source script``, which is the same as ``. script``, *reads and executes commands from filename* in **the current shell** environment.


:green:`3.` :bold:`Correct bash and shell script variable capitalization`

    * If you export a environment variable, use upper case convention.
    * The main reason for using uppercase variable names was to avoid conflicts with shell commands.
    * All the text books I've looked at always user upper case for all shell variables. While lower case variable names are permissible, uppercase is the convention.

    `Ref from SO <https://stackoverflow.com/questions/673055/correct-bash-and-shell-script-variable-capitalization>`_
