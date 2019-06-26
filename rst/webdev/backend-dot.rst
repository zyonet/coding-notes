Django OAuth Toolkit
====================

Documentation for DOT: `(Documents) Django OAuth Toolkit <https://django-oauth-toolkit.readthedocs.io/en/latest/>`_.
GitHub Link for DOT: `(Git Repo)Django OAuth Toolkit <https://django-oauth-toolkit.readthedocs.io/en/latest/>`_.


Unable to use OAUTH2 Django
---------------------------

**Issue description**: After following the `DOT & Django Rest Framework setup guide <https://django-oauth-toolkit.readthedocs.io/en/latest/rest-framework/getting_started.html#step-1-minimal-setup>`_, you find yourself will be redirected to ``localhost:8000/accounts/login/?next=/o/applications`` when trying to visit ``http://localhost:8000/o/applications/``.

**Solution**: The guide doesn't mention it but you need an authenticated session before you can access that page. Add the following steps:

Create a user: ``python manage.py createsuperuser``

Start up the django server: ``python manage.py runserver``

Get a validated Session by logging into the admin page with the admin account that you just created: ``http://localhost:8000/admin``

Then navigate to the page the guide references: ``http://localhost:8000/o/applications/``

How to solve the CORS problem
-----------------------------

1.  Since the domain that will originate the request (the app on Heroku) is different from the destination domain (your local instance), you will need to install the django-cors-middleware app. These “cross-domain” requests are by default forbidden by web browsers unless you use CORS.

.. code-block:: bash

    $ pip install django-cors-middleware


2. add *corsheaders* to the installed apps, and enable admin:

.. code-block:: python

    INSTALLED_APPS = {
        'django.contrib.admin',
        # ...
        'oauth2_provider',
        'corsheaders',
    }

3. Include the CORS middleware in your settings.py

.. code-block:: python

    MIDDLEWARE = (
        # ...
        'corsheaders.middleware.CorsMiddleware',
        # ...
    )

    # Or on Django < 1.10:
    MIDDLEWARE_CLASSES = (
        # ...
        'corsheaders.middleware.CorsMiddleware',
        # ...
    )

4. Allow CORS requests from all domains (jsut for the scope of this notes)

.. code-block:: python

    CORS_ORIGIN_ALLOW_ALL = True


How to generate an AccessToken programatically in Django
--------------------------------------------------------

:ref: https://stackoverflow.com/questions/17868049/how-to-generate-an-accesstoken-programatically-in-django

.. code-block:: bash

    >>> from oauth2_provider.models import Application
    >>> app = Application.objects.create(name="Sample ORM", client_type="public", authorization_grant_type="password", user_id=1)
    <Application: Sample ORM>
    >>> import requests
    >>> from requests.auth import HTTPBasicAuth
    >>>
    >>>
    >>> data = "grant_type=password&username=admin&password=d3@narmada13"
    >>> headers = {"content-type": "application/x-www-form-urlencoded"}
    >>> r = requests.post(token_url, data=data, auth=(app.client_id, app.client_secret), headers=headers)
    >>> print r.content
    {"access_token": "5kEaw4O7SX6jO9nT0NdzLBpnq0CweE", "token_type": "Bearer", "expires_in": 7776000, "refresh_token": "ZQjxcuTSTmTaLSyfGNGqNvF3M6KzwZ", "scope": "read write"}
    >>> import json
    >>> json.loads(r.content)['access_token']
    u'5kEaw4O7SX6jO9nT0NdzLBpnq0CweE'
    >>>


How to delete expired access tokens
-----------------------------------

Method 1
^^^^^^^^

**Q**: Is there any way to delete all expired access tokens from database? At present there's no mechanism provided by oauth2 for deletion of expired Access Tokens.

**A**: You can run from django shell or create custom management command that executes

.. code-block:: python

    from provider.oauth2.models import AccessToken
    AccessToken.objects.filter(expires__lt=datetime.now()).delete()


Method 2
^^^^^^^^

Why not (at least) configure a static ``REFRESH_TOKEN_EXPIRE_SECONDS`` which indicated how long we want to keep the ``access_token`` + ``refresh_token`` pair after the access token has expired.

The cleanup mechanism could then be:

.. code-block:: python

    with transaction.atomic():
        if REFRESH_TOKEN_EXPIRE_SECONDS:
            refresh_expire_date = timezone.now() - timedelta(seconds=REFRESH_TOKEN_EXPIRE_SECONDS)
            RefreshToken.objects.filter(access_token__expires__lt=refresh_expire_date).delete()
         AccessToken.objects.filter(refresh_token__isnull=True, expires__lt=datetime.now().delete())

Basically, you can run ``AccessToken.objects.filter(refresh_token__isnull=True, expires__lt=datetime.now().delete())`` as a periodic task, or it can be easily converted into a management command.

We can delete any access tokens that have expired and that do not have a corresponding refresh token, i.e., the refresh token for that access token has been used. Unused refresh tokens and their related access tokens will still hang around.
