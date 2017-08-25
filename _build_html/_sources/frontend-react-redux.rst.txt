React Redux
===========

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
