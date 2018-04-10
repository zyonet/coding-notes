Mac
===

Move cursor in macOS terminal
-----------------------------
* ``ctrl`` + ``e`` will take you to the end of the line.

* ``ctrl`` + ``a`` will take you to the front of the line.

* Follow `word movement in terminal <http://blog.macromates.com/2006/word-movement-in-terminal/>`_

* ``ctrl`` + ``w`` will delete a word and go back.

* ``ctrl`` + ``q`` will delete to the front of the line.


How to reinstall macOS and setup for programming
------------------------------------------------

Enter recovery mode
~~~~~~~~~~~~~~~~~~~

Press ``command + R`` immediately after you clicked ``restart`` button. You can release the keys the moment you see the apple logo.

Erase the Macintosh HD disk if needed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If you want a brand new macOS, you can go to disk utility to erase the contents on Macintosh HD.

Reinstall macOS
~~~~~~~~~~~~~~~
After clicking reinstall macOS, just follow the guides on the screen. (It usually takes you around 6 minutes to download macOS installer and 28 minutes to install) You will need to provide your apple ID and password for personalized setup.

Install Xcode
~~~~~~~~~~~~~
Got to apple store, install Xcode.

Install Homebrew
~~~~~~~~~~~~~~~~
Follow the guides in the homepage of `Homebrew <https://brew.sh/>`_.

Install zsh
~~~~~~~~~~~
Run this in the terminal: ``brew install zsh zsh-completions``

Install oh-my-zsh
~~~~~~~~~~~~~~~~~
Follow the guide of installing `oh-my-zsh <https://github.com/robbyrussell/oh-my-zsh>`_

Two important things to do

1. Uncomment 2nd line in ``.zshrc``

2. Add a line below the second line: ``export PATH="/usr/local/bin:${PATH}"``

Open terminal preference, select ``Profiles``, choose ``Pro`` as default profile.

Install tree
~~~~~~~~~~~~
Install: ``brew install tree``

Usage: ``tree`` or ``tree -L 1`` (``1`` at the end is listing depth.)

Install && Setup Git
~~~~~~~~~~~~~~~~~~~~

1. install git
^^^^^^^^^^^^^^

.. code-block:: bash

    $ brew install git
    $ git --version
    $ where git
    $ whereis git
    $ which git


``which git`` should output ``/usr/local/bin/git``. (In the above install oh-my-zsh guide, we added a line below the second line in ``.zshrc`` file can ensure now we are using the homebrew installed git instead of the one in ``/usr/bin/git``)

2. define Git user (should be the same name and email you use for GitHub)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ git config --global user.name "You name here"
    $ git config --global user.email "your email here"

3. setup keycache for avoiding input password every time you push using https
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ git config --global credential.helper osxkeychain

4. Setup ssh for git
^^^^^^^^^^^^^^^^^^^^

:ref: https://help.github.com/articles/connecting-to-github-with-ssh/

.. note:: You don't need to manually create .ssh folder under home directory. After the first time you use ``ssh-keygen``, it will automatically be generated for you. But the file named ``config`` under ``.ssh`` might need you to manually create it. You can simply type ``touch config`` under ``.ssh`` folder.

On a Mac, it is important to remember to add ``.DS_Store`` (a hidden OSX system file that's put in folders) to your .gitignore files.

If you never want to include ``.DS_Store`` files in your Git repo, you can configure your Git to globally exclude those files.

.. code-block:: bash

    # specify a global exclusion list
    $ git config --global core.excludesfile ~/.gitignore
    # adding .DS_Store to that list
    $ echo .DS_Store >> ~/.gitignore

Install Sublime and create shortcut
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Download `Sublime <https://www.sublimetext.com>`_ from its homepage.

use CLI to open file:

let's create a shorcut so we can launch Sublime text from the command-line:

.. code-block:: bash

    $ ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

Now you can open a file with ``$ subl myfile.py`` or start a new project in the current directory with ``$ subl .``

Pricing:

Sublime Text is not free but it has an unlimited evaluation period that comes with notification pop-ups asking you to buy it, if you wish to remove the pop-ups you can purchase the tool.

Install Python3
~~~~~~~~~~~~~~~
Download `Python3 <https://www.python.org/downloads/release/python-362/>`_ from official website. And click pkg to install. After that, ``pip install virtualenv``

Install node.js
~~~~~~~~~~~~~~~
Download `node <https://nodejs.org/en/download/>`_ pkg and click to install. Very easy and convenient.

Install create-react-app
~~~~~~~~~~~~~~~~~~~~~~~~
``npm install -g create-react-app``


Install VMWare Fusion
~~~~~~~~~~~~~~~~~~~~~
Download `VMWare Fusion <https://www.vmware.com/products/fusion.htm/>`_ click to install.

If you want to copy a vm, follow this `guide <https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1023555>`_
(I followed once, and it does work. You have to choose the vm disk instead of copy the whole VMBundle. And remember to set the network setting to bridged otherwise port forwarding might not work.)

Install postgresql.app
~~~~~~~~~~~~~~~~~~~~~~
Download `postgresql <https://postgresapp.com>`_ from here and follow the guide on the homepage.

Install Jetbrains IDEs
~~~~~~~~~~~~~~~~~~~~~~

Install quick-look-plugins
~~~~~~~~~~~~~~~~~~~~~~~~~~
`Quick-Look-Plugins <https://github.com/sindresorhus/quick-look-plugins/>`_


Install BitBar
~~~~~~~~~~~~~~
Download `BitBar-v1.9.2.zip <https://github.com/matryer/bitbar/releases/tag/v1.9.2>`_ from here. Move it to Applications folder, then click to set plugin folder.

After the above actions, you can install plugins from `homepage <https://getbitbar.com>`_

Install iStatMenus and BetterSnapTool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Need package and keys.

Install neofetch
~~~~~~~~~~~~~~~~
Intro: Neofetch is a CLI system information tool written in BASH. Neofetch displays information about your system next to an image, your OS logo, or any ASCII file of your choice. The main purpose of Neofetch is to be used in screenshots to show other users what OS/Distro you're running, what Theme/Icons you're using etc.
Follow the `instructions <https://github.com/dylanaraps/neofetch/wiki/Installation>`_ here.

Install libpng
~~~~~~~~~~~~~~
1. About the App
^^^^^^^^^^^^^^^^

    * App name: libpng
    * App description: Library for manipulating PNG images
    * App website: http://www.libpng.org/pub/png/libpng/html

2. Install the App
^^^^^^^^^^^^^^^^^^

    * Open terminal
    * run in terminal: ``ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null``
    * run ``brew install libpng``

Done! Now you can use ``libpng``.


.. _mbp_terminal_shortcut:

How to open folders/projects with IDEs/textEditors from Terminal on Mac
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* For Jetbrains IDE, you can configure it using ``tools/create-commandline-launcher``.

* For Sublime, follow this guide: `Launching sublime from terminal <https://ashleynolan.co.uk/blog/launching-sublime-from-the-terminal>`_.

Here're the names of shortcuts on my mac. *The namings below are mainly due to my own preference*.

1. ``webs`` for using ``webstorm`` IDE
2. ``asdf`` for using ``pycharm`` IDE
3. ``subl`` for using ``sublime`` textEditor


How to keep Mac awake AND locked
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. In System Preferences > Energy Saver, check the box for "Prevent computer from sleeping automatically when the display is off" (on laptops, this is under the Power Adapter tab)
2. In System Preferences > Security & Privacy, check the box for "Require password after sleep or screen saver begins" and set the delay in the dropdown menu to "immediately"


Now, you can hit ``command-option-power`` to turn off the display without sleeping the computer, and doing anything that turns on the display (like hitting a key or clicking a mouse button) will prompt you for your account password.


.. _copy_path_in_macOS:

How to copy path in macOS without adding any services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1. Navigate to the file or folder you wish to copy the path for

2. Right-click (or Control+Click, or a Two-Finger click on Trackpads) on the file or folder in the Mac Finder

3. While in the right-click menu, hold down the OPTION key to reveal the “Copy (item name) as Pathname” option, it replaces the standard Copy option

4. Once selected, the file or folders path is now in the clipboard, ready to be pasted anywhere


how to verify checksum
----------------------

:ref: https://forums.appleinsider.com/discussion/192161/how-to-verify-checksums-when-you-download-an-app-for-your-mac


how to uninstall jetbrains IDEs on macOS
----------------------------------------

:ref: https://apple.stackexchange.com/questions/231769/how-to-uninstall-jetbrains-ide