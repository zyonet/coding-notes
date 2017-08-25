Django Rest Framework
=====================

Serializer Fields
-----------------

Each serializer field class constructor takes arguments. And ``required`` is one of the acceptable arguments.

Normally an error will be raised if a field is not supplied during deserialization. Set to false if this field is not required to be present during deserialization.

Setting this to ``False`` also allows the object attribute or dictionary key to be omitted from output when serializing the instance. If the key is not present it will simply not be included in the output representation.

**Defaults to ``True``**.

One more time, defaults to be ``True``.



URL Conf
--------

.. pull-quote:: If you're using ``viewsets`` instead of ``views``, you can *automatically* generate the URL conf for your API, by simply registering the ``viewsets`` with a router class.

.. pull-quote:: Again, if you need more control over the API URLs you can simply drop down to using regular class-based views, and writing the URL conf explicitly.

Why class-based views
---------------------
.. note:: **Why do we need to use class-based views sometimes?** You can write **API views** using `class-based views`, rather than `function based views`. This is a powerful pattern that allows us to

    1. reuse common functionality (it allows us to easily compose reusable bits of behaviour)
    2. helps us keep our code DRY
    3. better separation between the different HTTP methods

class-based views vs function-based views
-----------------------------------------

Views vs ViewSets
-----------------

Using viewsets is less explicit than building your views individually.
