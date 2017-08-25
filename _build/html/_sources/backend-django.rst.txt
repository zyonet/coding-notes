Django
======

Django Test Assert Types
------------------------

1. ``self.AssertQuerysetEqual(response.context['latest_question_list'], ['<Question: Past question.>'])``

2. ``self.AssertIn(recent_question.is_published_recently, True)``

3. ``self.AssertEqual(reponse.status_code, 200)``

4. ``self.AssertContains(response, 'No polls are availbale.')``

See also :ref:`python-assertions-label`.

Speeding up the tests
---------------------

1. As long as your tests are properly isolate3d, you can run them in parallel to gain a speed up on multi-core hardware: ``python manage.py test --parallel``

2. The default password hasher is rather slow by design. If you’re authenticating many users in your tests, you may want to use a custom settings file and set the PASSWORD_HASHERS setting to a faster hashing algorithm:

.. code-block:: python

    PASSWORD_HASHERS = [
    'django.contrib.auth.hashers.MD5PasswordHasher',
    ]


Site matching query does not exist
----------------------------------

If you encounter the warning of ``site matching query does not exist``, that's probably due to the fact that you have not specify the ``SITE_ID`` parameter in your ``settings.py``.

For solving this issue, please add ``SITE_ID = 1`` to your ``settings.py`` file.

If adding ``SITE_ID = 1`` cannot solve your issue, chances are that you don't have a site defined in your database and django wants to reference it. Hence you will need to create one. See below.

From a ``python manage.py shell``:

.. code-block:: python

    from django.contrib.sites.models import Site
    new_site = Site.objects.create(domain='foo.com', name='foo.com')
    print new_site.id


Now set that site ID in your settings.py to SITE_ID. Hopefully now this issue will be solved.


How to delete the database and start again
------------------------------------------

.. code-block:: bash

    $ rm -f tmp.db db.sqlite3
    $ rm -r snippets/migrations
    $ python manage.py makemigrations snippets
    $ python manage.py migrate

Auth terms
----------

1. Authentication: authentication verifies a user is who they claim to be.
2. Authorization : authorization determines what an authenticated user is allowed to do.


Naming Conventions for Django Projects
--------------------------------------

.. note:: You’ll need to avoid naming projects after built-in Python or Django components. In particular, this means you should avoid using names like django (which will conflict with `Django` itself) or `test` (which conflicts with a built-in Python package).

if you run:

.. code-block:: bash

    $ django-admin startproject mysite

You will get an directory as below:

    * mysite/
        * manage.py
        * mysite/
            * __init__.py
            * settings.py
            * urls.py
            * wsgi.py

Be aware:
1. The outer mysite/ root directory is just a container for your project. Its name doesn’t matter to Django; **you can rename it to anything you like**.
2. The inner mysite/ directory is **the actual Python package** for your project. Its name is **the Python package name** you’ll need to use to import anything inside it (e.g. mysite.urls).

Hence

* you can rename the name of the outer directory to any other name as you like.
* Do not rename the inner directory, especially after you have some codes using its name for import already.


Create our poll app right next to your manage.py file so that it can be imported as its own top-level module, rather than a submodule of mysite.

To start your app, make sure you’re in the same directory as manage.py and type this command:

.. code-block:: bash

    $ python manage.py startapp polls



Sessions and Cookies
--------------------

1. What is a cookie
^^^^^^^^^^^^^^^^^^^

A cookie is a small piece of text stored on a user's computer by their browser. Common uses for cookies are authentication, storing of site preferences, shopping cart items, and server session identification.

Each time the users' web browser interacts with a web server it will pass the cookie information to the web server. Only the cookies stored by the browser that relate to the domain in the requested URL will be sent to the server. This means that cookies that relate to www.example.com will not be sent to www.exampledomain.com.

In essence, a cookie is a great way of linking one page to the next for a user's interaction with a web site or web application.

2. What is a session
^^^^^^^^^^^^^^^^^^^^

A session can be defined as a server-side storage of information that is desired to persist throughout the user's interaction with the web site or web application.

Instead of storing large and constantly changing information via cookies in the user's browser, only a unique identifier is stored on the client side (called a "session id"). This session id is passed to the web server every time the browser makes an HTTP request (ie a page link or AJAX request). The web application pairs this session id with it's internal database and retrieves the stored variables for use by the requested page.


:Stanford University cs142: https://web.stanford.edu/~ouster/cgi-bin/cs142-fall10/lecture.php?topic=cookie


Relationships in Models
-----------------------

Clearly, the power of *relational databases* lies in relating tables to each other.

.. note:: Three most common types of *database relationships*:

    * many-to-one
    * many-to-many
    * one-to-one

1. Many-to-one (foreign key)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^


For example, if a Car model has a Manufacturer – that is, a Manufacturer makes multiple cars but each Car only has one Manufacturer – use the following definitions:

.. code-block:: python

    from django.db import models
    class Manufacturer(models.Model):
        # ...
        pass
    class Car(models.Model):
        manufacturer = models.ForeignKey(Manufacturer)
        # ...


It is like, now you have user model, and you created a PasswordReset model with user ad the foreign key, and you can sotre multiple records in PasswordReset model for the same user.

This is the meaning of the ``foreign key``, or ``many-to-one``.

.. note::  It’s suggested, but not required, that the name of a ForeignKey field (manufacturer in the example above) be the name of the model, lowercase. You can, of course, call the field whatever you want


If you delete a reporter, his articles will be deleted (assuming that the ForeignKey was defined with django.db.models.ForeignKey.on_delete set to CASCADE, which is the default):

>>> Article.objects.all()
[<Article: John's second story>, <Article: Paul's story>, <Article: This is a test>]
>>> Reporter.objects.order_by('first_name')
[<Reporter: John Smith>, <Reporter: Paul Jones>]
>>> r2.delete()
>>> Article.objects.all()
[<Article: John's second story>, <Article: This is a test>]
>>> Reporter.objects.order_by('first_name')
[<Reporter: John Smith>]

Similarly, if you delete a user, other records in other tables (tables which are using **user** model as foreign key) should also be deleted.

2. Many-to-many relationships
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. todo:: add m-t-m



3. One-to-one relationships
^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. todo:: add o-t-o

.. note:: There are some features provided by Django that i am not using them frequently while they are useful. See below.

Making Queries
--------------

1. Models to be referred to
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Throughout this guide (and in the reference), we’ll refer to the following models, which comprise a Weblog application:

.. code-block:: python

    from django.db import models

    class Blog(models.Model):
        name = models.CharField(max_length=100)
        tagline = models.TextField()

        def __str__(self):              # __unicode__ on Python 2
            return self.name

    class Author(models.Model):
        name = models.CharField(max_length=50)
        email = models.EmailField()

        def __str__(self):              # __unicode__ on Python 2
            return self.name

    class Entry(models.Model):
        blog = models.ForeignKey(Blog)
        headline = models.CharField(max_length=255)
        body_text = models.TextField()
        pub_date = models.DateField()
        mod_date = models.DateField()
        authors = models.ManyToManyField(Author)
        n_comments = models.IntegerField()
        n_pingbacks = models.IntegerField()
        rating = models.IntegerField()

        def __str__(self):              # __unicode__ on Python 2
            return self.headline



2. Chaining filters
^^^^^^^^^^^^^^^^^^^

The result of refining a ``QuerySet`` is itself a ``QuerySet``, so it’s possible to chain refinements together. For example:

>>> Entry.objects.filter(
...     headline__startswith='What'
... ).exclude(
...     pub_date__gte=datetime.date.today()
... ).filter(
...     pub_date__gte=datetime(2005, 1, 30)
... )


Notice the usage of ``exclude``.

3. Saving ForeignKey and ManyToMany Fields
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4. ForeignKey
^^^^^^^^^^^^^

>>> from blog.models import Entry
>>> entry = Entry.objects.get(pk=1)
>>> cheese_blog = Blog.objects.get(name="Cheddar Talk")
>>> entry.blog = cheese_blog
>>> entry.save()

5. ManyToManyField
^^^^^^^^^^^^^^^^^^

>>> john = Author.objects.create(name="John")
>>> paul = Author.objects.create(name="Paul")
>>> george = Author.objects.create(name="George")
>>> ringo = Author.objects.create(name="Ringo")
>>> entry.authors.add(john, paul, george, ringo)

.. note:: ``filter()`` will always give you a ``QuerySet``, even if only **a single object** matches the query - in this case, it will be a ``QuerySet`` containing **a single element**.

6. Sitemaps
^^^^^^^^^^^

What are sitemaps:

Sitemaps are an easy way for webmasters to inform search engines about pages on their sites that are available for crawling. In its simplest form, a Sitemap is an XML file that lists URLs for a site along with additional metadata about each URL (when it was last updated, how often it usually changes, and how important it is, relative to other URLs in the site) so that search engines can more intelligently crawl the site.
Web crawlers usually discover pages from links within the site and from other sites. Sitemaps supplement this data to allow crawlers that support Sitemaps to pick up all URLs in the Sitemap and learn about those URLs using the associated metadata. Using the Sitemap protocol does not guarantee that web pages are included in search engines, but provides hints for web crawlers to do a better job of crawling your site.



Ref:

:Django Many-to-one relationship: https://docs.djangoproject.com/en/1.8/topics/db/examples/many_to_one/