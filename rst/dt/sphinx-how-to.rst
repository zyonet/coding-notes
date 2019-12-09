Sphinx How To
=============

How to use custom css for stylization
-------------------------------------
This method works for both ``sphinx-autobuild`` and ``make html``.

step 1. make sure sphinx version ``>= 1.8``
step 2. place ``your-custom.css`` file under ``_static/css/your-custom.css``
step 3. add ``html_css_files = ['css/aliwang-custom.css',]`` to ``conf.py``, refer to `sphinx docs for adding css <https://docs.readthedocs.io/en/stable/guides/adding-custom-css.html>`_ for detail.
step 4. write css in ``your-custom.css`` (css name can be customized, just make sure the name matches with name defined in ``conf.py``), 
step 5. write ``role`` definition in rst
step 6. use the newly defined role in rst

example:  bolditalic in sphnx!

.. code-block:: css
   
   .red { color: red; }
   .bolditalic {
     font-weight: bold;
     font-style: italic;
   }

.. code-block:: text

   .. role:: red
     :class: red

   .. role:: bolditalic
     :class: bolditalic

   :red:`WARNING` :bolditalic:`Don't be stupid!`

Avoid duplication when using customized css: 

My setup: todo1

1. add ``rst_prolog = open('global.rst', 'r').read()`` to *conf.py*
2. create *global.rst* with the contents below (note last line is a blank line, no blank line needed at the first line):

    .. code-block:: rst

        .. role:: red
          :class: red
        
        .. role:: green
          :class: green
        
        .. role:: blue
          :class: blue
        
        .. role:: bolditalic
          :class: bolditalic
        
        .. role:: bold
          :class: bold


`ref from so <https://stackoverflow.com/questions/9698702/how-do-i-create-a-global-role-roles-in-sphinx>`_

How to write math
-----------------

http://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html?#math

https://zh-sphinx-doc.readthedocs.io/en/latest/ext/math.html

http://www.xavierdupre.fr/blog/2014-04-13_nojs.html

Example of how to force line breaks:
ref: https://salishsea-meopar-docs.readthedocs.io/en/latest/work_env/sphinx_docs.html#forcing-line-breaks

.. |br| raw:: html

    <br>

===========  ===================================================  ==============  ==================
 Date                       Change                                New Value       Changeset
===========  ===================================================  ==============  ==================
27-Oct-2014  1st :file:`nowcast/` run results                     N/A
20-Nov-2014  1st :file:`forecast/` run results                    N/A
26-Nov-2014  Changed to tidal forcing tuned for better |br|       see changeset   fake change
             accuracy at Point Atkinson
===========  ===================================================  ==============  ==================

Customize rtd theme
-------------------
https://github.com/rtfd/sphinx_rtd_theme

Clone above repo, read ``conf.py``, you will know how to customize the theme.
For example, you can hide ``Build with Sphinx`` on footer, hide ``Show page source`` and add favicon.

How to embed images and figures
-------------------------------

.. image:: ../../images/inter_link_1.png
   :width: 200px
   :height: 100px
   :scale: 50 %
   :alt: alternate text
   :align: right

.. figure:: ../../images/inter_link_2.png
   :scale: 50 %
   :alt: map to buried treasure

   This is the caption of the figure (a simple paragraph).

How to referencing figures with numbers in Sphinx and reStructuredText
----------------------------------------------------------------------
In the latest versions of Sphinx (1.3+), numbering figures and referencing them from text got a bit easier as support for it is now built-in.

.. code-block:: rst

    .. _your-label:
    .. figure:: ../../images/my_figure.png

    At :numref:`your-label` you can see...

Click `sphinx numref <http://www.sphinx-doc.org/en/stable/markup/inline.html#cross-referencing-figures-by-figure-number>`_ for a reference to official docs for ``:numref:``.

The end result should be something like "At Fig 1.1 you can see...". This technique works both with the default HTML output and the LaTeX output.

In your ``conf.py`` file, make sure to set the flag ``numfig = True`` (click `sphinx config <http://www.sphinx-doc.org/en/stable/config.html#confval-numfig>`_ for reference to offcial docs). There are also configuration options for the references' text format (``numfig_format`` and ``numfig_secnum_depth``).





how to generate an internal link
--------------------------------

**Step 1**  define a symbol to link to. (be sure to define it as ``.. _mbp_internal_link`` instead of ``.. mbp_internal_link``. That underscore ``_`` does matter.)

.. figure:: ../../images/inter_link_1.png
   :scale: 50 %
   :alt: one of the images

   Picture 1. Look at line 4

**Step 2**  use the symbol defined in *step 1* in any place within the docs.

.. figure:: ../../images/inter_link_2.png
   :scale: 50 %
   :alt: one of the images

   Picture 2. Look at line 32


how to generate an external link
--------------------------------

There are two ways to do this (Please use ``View page source`` to learn it):

Using named reference
~~~~~~~~~~~~~~~~~~~~~

Test hyperlink: StackOverflow_.

.. _StackOverflow: http://stackoverflow.com/

Using embedded URI (better than above)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Test hyperlink: `Stack Overflow <http://stackoverflow.com/>`_.



Header levels
-------------
level 1: the first party

``===========``

level 1 desc: this document is about xyz

level 2

``-----------``

level 2 desc

level 3

``~~~~~~~~~~~``

level 3 content

level 4

``^^^^^^^^^^^``

level 4 content

level 5

``'''''''''''``

level 5 content

Section headers are created by underlining (and
optionally overlining) the section title with a punctuation character, at least
as long as the text::

   =================
   This is a heading
   =================

Normally, there are no heading levels assigned to certain characters as the
structure is determined from the succession of headings.  However, this
convention is used in `Python's Style Guide for documenting
<https://docs.python.org/devguide/documenting.html#style-guide>`_ which you may
follow:

* ``#`` with overline, for parts
* ``*`` with overline, for chapters
* ``=``, for sections
* ``-``, for subsections
* ``^``, for subsubsections
* ``"``, for paragraphs

..
    comment

.. comment

saDFs

..
   This whole indented block
   is a comment.

   Still in the comment.




