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

1. set proxy in *.bashrc*

2. set proxy in **vscode**

3. set proxy in *.gitconfig* for git clone from github in pc behind a proxy


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
