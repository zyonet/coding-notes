React & Redux
=============

.. note:: A **container** does data fetching and then renders its corresponding sub-component.

.. caution:: Please be careful of the ``imports`` in react apps! Refer to the three pictures below to get a sense.

**Error Description**: *Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: undefined.*

Sometimes, you should not use the curly braces! So if there is a problem, just try both: use and not use curly braces. one of the ways should work.


.. figure:: ./images/type_invalid1.png
   :scale: 50 %
   :alt: one of the images

   Picture 1.



.. figure:: ./images/type_invalid2.png
   :scale: 50 %
   :alt: one of the images

   Picture 2.



.. figure:: ./images/type_invalid3.png
   :scale: 50 %
   :alt: one of the images

   Picture 3.


How to escape single quote in HTML
----------------------------------

You can also use ``&apos;``, which is iffy in IE,
or ``&#39;``, which should work everywhere.

That is to say:

* ``&#39;`` or ``&apos;`` for ``'``

* ``&#34;`` for ``''``


Reference: `How do I escape a single quote? <https://stackoverflow.com/questions/2428572/how-do-i-escape-a-single-quote?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa>`_
For more: `Character entity references in HTML <https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references#Character_entity_references_in_HTML>`_
