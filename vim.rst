Vim
===

Keyboard Shortcuts
------------------

Navigation
~~~~~~~~~~

* ``ctrl + f``: move down one page
* ``ctrl + b``: move up one page
* ``ctrl + u``: move up half page
* ``ctrl + d``: move down half page

* ``G``: move cursor to the bottom of the file
* ``gg``: move cursor to the top of the file

* ``H``: capital H, to move to the top of the screen
* ``L``: capital L, to move to the bottom of the screen

* ``w``: move forward word by word
* ``b``: move backward word by word

* ``u``: undo.
* ``ctrl + r``: redo.

Go back to directory browsing after opening file in vim
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`Stackoverflow Ref <https://stackoverflow.com/questions/9160499/go-to-back-directory-browsing-after-opening-file-in-vim>`_

1. Go back to last buffer using: ``:b#`` (if you just opened a file, then it will bring you just back to the directory browsing.
2. Return to Explorer: ``:Rex``
3. Open the Explorer: ``:Ex``
4. Jump back to the previous locatioin, not necessarily a bufer: ``ctrl + 0``

Delete
~~~~~~

* ``d0``: delete from cursor position to line start.
* ``c0``: delete from cursor position to line start and enter insert mode.

Switch Off Auto Indentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Run all the commands below to turn off the auto indentation.

* ``set nocindent``
* ``set nosmartindent``
* ``set noautoindent``
* ``set indentexpr=``
* ``filetype indent off``
* ``filetype plugin indent off``

To solve the indentation problem when pasting code,
you can use ``set paste``, then paste, then ``set nopaste``.

Navigate to the dir of the current file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
``:Sex``, ``:Vex``, ``:Tex`` and ``:Ex`` are all usefull commands for 
ex(ploring) the files on your system, where S/V/T stands for Split/Vertical/Tab.

