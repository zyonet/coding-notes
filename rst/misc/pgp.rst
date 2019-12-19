PGP
===

.. note:: 

    1. GPG: GNU Privacy Guard, also known as GnuPG, command line tool, a complete and free implementation of the OpenPGP standard as defined by RFC4880, also known as PGP (Pretty Good Privacy). GPG, also known as GnuPG, is a command line tool with features for easy integration with other applications.
    2. PGP: Pretty Good Privacy encryption, a data encryption computer program that gives cryptographic privacy and authentication for online communication.
    3. ASCII Armor: OpenPGP provides the service of converting the raw 8-bit binary octet stream to a stream of printable ASCII characters, called Radix-64 encoding or ASCII Armor.

    The creator of PGP wrote the second chapter of the book :download:`An-Introduction-To-PGP-Cryptography.pdf <../../_static/downloads/An-Introduction-To-PGP-Cryptography.pdf>`, read it and many concepts shall be clear.

Get Started
-----------

Check GPG verison 
^^^^^^^^^^^^^^^^^
First run:

.. code-block:: bash

    gpg --version | head -n1

If you see ``gpg (GnuPG) 1.4.x``, then you are using ``GnuPG v.1``. Try the ``gpg2`` command:

.. code-block:: bash

    gpg2 --version | head -n1

If you see ``gpg (GnuPG) 2.x.x``, then you are good to go. This guide will assume you have the version 2.2 of GnuPG (or later). If you are using version 2.0 of GnuPG, some of the commands in this guide will not work, and you should consider installing the latest 2.2 version of GnuPG.

.. tip:: **Making sure you always use GnuPG v.2**

    If you have both gpg and gpg2 commands, you should make sure you are always using GnuPG v2, not the legacy version. You can make sure of this by setting the alias:
    ``$ alias gpg=gpg2``. You can put that in your *.bashrc* to make sure it's always loaded whenever you use the gpg commands.

Generate Your Master PGP Key
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To generate your new master key, issue the following command, putting in the right values instead of "Alice Engineer":

.. code-block:: bash

    $ gpg --quick-generate-key 'Alice Engineer <alice@example.org>' rsa4096 cert

Add Relevant Identities
^^^^^^^^^^^^^^^^^^^^^^^
This section is optional. It is recommended that you only use a single identity for clarity.

If you have multiple relevant email addresses (personal, work, open-source project, etc), you should add them to your master key. You don't need to do this for any addresses that you don't expect to use with PGP (e.g. probably not your school alumni address).

The command is (put the full key fingerprint instead of [fpr]):

.. code-block:: bash

    $ gpg --quick-add-uid [fpr] 'Alice Engineer <allie@example.net>'

You can review the UIDs you've already added using:

.. code-block:: bash

    $ gpg --list-key [fpr] | grep ^uid

Pick the primary UID. GnuPG will make the latest UID you add as your primary UID, so if that is different from what you want, you should fix it back:

.. code-block:: bash

    $ gpg --quick-set-primary-uid [fpr] 'Alice Engineer <alice@example.org>'

Backup Your Master PGP Key
^^^^^^^^^^^^^^^^^^^^^^^^^^

*Paperkey* is available on all Linux distros, as well as installable via ``brew install paperkey`` on macOS.

Run the following command, replacing ``[fpr]`` with the full fingerprint of your key:

.. code-block:: bash

    $ gpg --export-secret-key [fpr] | paperkey -o /tmp/key-backup.txt
    # or first export ``my-secret-key.gpg`` and ``my-public-key.gpg``, then
    $ paperkey --secret-key my-secret-key.gpg --output bak.txt
    # if you want to recover your secret key:
    $ paperkey --pubring my-public-key.gpg --secrets bak.txt --output my-secret-key.gpg
　
Print out that file, then take a pen and write the key passphrase on the margin of the paper. This is a required step because the key printout is still encrypted with the passphrase, and if you ever change the passphrase on your key, you will not remember what it used to be when you had first created it -- **guaranteed**.

Put the resulting printout and the hand-written passphrase into an envelope and store in a secure and well-protected place, preferably away from your home, such as your bank vault.

Generate PGP Subkeys
^^^^^^^^^^^^^^^^^^^^
To create the subkeys, run:

.. code-block:: bash

    $ gpg --quick-add-key [fpr] rsa2048 encr
    $ gpg --quick-add-key [fpr] rsa2048 sign

    # You can also create the Authentication key, which 
    # will allow you to use your PGP key for ssh purposes:
    $ gpg --quick-add-key [fpr] rsa2048 auth

Review your key information using ``gpg --list-key ［fpr］``

Upload Your Public Keys to the Keyserver
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Your key creation is complete, so now you need to make it easier for others to find it by uploading it to one of the public keyservers. (Do not do this step if you're just messing around and aren't planning on actually using the key you've created, as this just litters keyservers with useless data.)

.. code-block:: bash

    $ gpg --send-key [fpr]

If this command does not succeed, you can try specifying the keyserver on a port that is most likely to work:

.. code-block:: bash

    $ gpg --keyserver hkps://hkps.pool.sks-keyservers.net --send-key [fpr]

Check if your keys has been uploaded to keyserver:

.. code-block:: bash

    $ gpg --keyserver hkps://hkps.pool.sks-keyservers.net --search-key '240519729317EFF4D5D4B2C0A79D0BA454113821'

You can receive others public key by 

.. code-block:: bash

    $ gpg --keyserver hkps://hkps.pool.sks-keyservers.net --recv-key '240519729317EFF4D5D4B2C0A79D0BA454113821'

.. note:: keyservers

    * hkps://hkps.pool.sks-keyservers.net
    * hkp://keyserver.ubuntu.com
    * hkp://pgp.mit.edu:80

Most keyservers communicate with each-other, so your key information will eventually synchronize to all the others.

If you use GitHub in your development (and who doesn't?), you should upload your key following the instructions they have provided:

* `Adding a PGP key to your GitHub account <https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account>`_

To generate the public key output suitable to paste in, just run:

.. code-block:: bash

    $ gpg --export --armor [fpr]


Remove Master Key
^^^^^^^^^^^^^^^^^

**First**, backup GnuPG directory. This is **required**.

.. code-block:: bash

    $ cp -rp ~/.gnupg [/media/disk/name]/gnupg-backup
    # If you get any Operation not supported on socket errors, those are benign and you can ignore them.
    # You should now test to make sure everything still works:
    $ gpg --homedir=[/media/disk/name]/gnupg-backup --list-key [fpr]

If you don't get any errors, then you should be good to go. Unmount the USB drive, distinctly label it so you don't blow it away next time you need to use a random USB drive, and put in a safe place -- but not too far away, because you'll need to use it every now and again for things like editing identities, adding or revoking subkeys, or signing other people's keys.

**Second**, remove master key from home directory.

Please see the First step and make sure you have backed up your GnuPG directory in its entirety. What we are about to do will render your key useless if you do not have a usable backup!

1. identify the keygrip of your master key:

.. code-block:: bash

    $ gpg --with-keygrip --list-key [fpr]

    # the output will be something like:
    # 
    # pub   rsa4096 2017-12-06 [C] [expires: 2019-12-06]
    #       111122223333444455556666AAAABBBBCCCCDDDD
    #       Keygrip = AAAA999988887777666655554444333322221111
    # uid           [ultimate] Alice Engineer <alice@example.org>
    # uid           [ultimate] Alice Engineer <allie@example.net>
    # sub   rsa2048 2017-12-06 [E]
    #       Keygrip = BBBB999988887777666655554444333322221111
    # sub   rsa2048 2017-12-06 [S]
    #       Keygrip = CCCC999988887777666655554444333322221111

2. Find the keygrip entry that is beneath the pub line (right under the master key fingerprint). This will correspond directly to a file in your home .gnupg directory:

.. code-block:: bash

    $ cd ~/.gnupg/private-keys-v1.d
    $ ls
    AAAA999988887777666655554444333322221111.key
    BBBB999988887777666655554444333322221111.key
    CCCC999988887777666655554444333322221111.key

All you have to do is simply remove the .key file that corresponds to the master keygrip:

.. code-block:: bash

    $ cd ~/.gnupg/private-keys-v1.d
    $ rm AAAA999988887777666655554444333322221111.key

Now, if you issue the --list-secret-keys command, it will show that the master key is missing (the # indicates it is not available):

.. code-block:: bash

    $ gpg --list-secret-keys
    sec#  rsa4096 2017-12-06 [C] [expires: 2019-12-06]
          111122223333444455556666AAAABBBBCCCCDDDD
    uid           [ultimate] Alice Engineer <alice@example.org>
    uid           [ultimate] Alice Engineer <allie@example.net>
    ssb   rsa2048 2017-12-06 [E]
    ssb   rsa2048 2017-12-06 [S]

**Third**, remove the revocation certificate.

Another file you should remove (but keep in backups) is the revocation certificate that was automatically created with your master key. A revocation certificate allows someone to permanently mark your key as revoked, meaning it can no longer be used or trusted for any purpose. You would normally use it to revoke a key that, for some reason, you can no longer control -- for example, if you had lost the key passphrase.

Just as with the master key, if a revocation certificate leaks into malicious hands, it can be used to destroy your developer digital identity, so it's better to remove it from your home directory.

.. code-block:: bash

    $ cd ~/.gnupg/openpgp-revocs.d
    $ rm [fpr].rev

Export Keys
^^^^^^^^^^^
If you need to copy public or private key to another device:

.. code-block:: bash

    # export ASCII Armored keys which are printable instead of in unarmored binary format.
    $ gpg --armor --output testingname-public-armored.asc --export 'testingname'
    $ gpg --armor --output testingname-private-armored.asc --export-secret-keys 'testingname'

Then you can copy the printable ASCII armored text and paste to send in email. However, it is not recommended that you send private key via email channel though it is protected by passphrase.

Move the Subkeys to a Hardware device
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This section is optional. For detail, refer to [1].

Encrypt and Decrypt File or folder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    # sign and encrypt
    $ gpg --armor -o tmp.txt.asc -se -r "WANG Zhenxiang <15113029g@connect.polyu.hk>" tmp.txt
    
    # decrypt
    $ gpg -o tmp_new_name.txt -d tmp.txt.asc

If you want to encrypt a directory, you will need to convert it to a file first. Run the command:

.. code-block:: bash

    $ tar czf myfiles.tar.gz mydirectory/

This gives you a new file 'myfiles.tar.gz' which you can then encrypt/decrypt. To turn a tarball back into a directory:

.. code-block:: bash

    $ tar xzf myfiles.tar.gz

Common GPG Commands
^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    # list public and private keys
    gpg --list-keys
    gpg --list-secret-keys

    # export public and private keys
    # export ASCII Armored keys which are printable instead of keys in unarmored binary format.
    gpg --armor --output testingname-public-armored.asc --export 'testingname'
    gpg --armor --output testingname-private-armored.asc --export-secret-keys 'testingname'
    
    # dearmor ASCII Armored key into binary format though I dont know when that is needed.
    gpg --dearmor the-asc-file.asc #　a new file called ``the-asc-file.asc.gpg`` will be produced in file system.

    # import keys
    gpg --import my-private-key.asc
    gpg --import my-public-key.asc

    # delete keys
    gpg --delete-keys <fingerprint-of-the-key-to-be-deleted>
    gpg --delete-secret-keys <fingerprint-of-the-key-to-be-deleted>

Trouble Shooting
----------------

Unsafe Ownership on Config File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Problem**:

If you run gpg related commands in terminal, you may see the warning below.

.. warning:: gpg: WARNING: unsafe ownership on configuration file `/home/<username>/.gnupg/gpg.conf`.

**Fixation**:

Fix the permissions of the directory *~/.gnupg*.

.. code-block:: bash

    # Step 1, Make sure, the folder+contents belong to you:
    chown -R $(whoami) ~/.gnupg/
    
    # Step 2, Correct access rights for .gnupg and subfolders:
    find ~/.gnupg -type f -exec chmod 600 {} \;
    find ~/.gnupg -type d -exec chmod 700 {} \;


References
----------

#. `Protecting code integrity with PGP <https://github.com/lfit/itpol/blob/master/protecting-code-integrity.md>`_
#. `Introduction to PGP encryption and decryption <https://developer.rackspace.com/blog/introduction-to-pgp-encryption-and-decryption/>`_
#. `How to use GPG to encrypt stuff <https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff.html>`_
#. `Paperkey - an OpenPGP key archiver <https://www.jabberwocky.com/software/paperkey/>`_
#. `How do I encrypt a file or folder in my home directory? <https://statistics.berkeley.edu/computing/encrypt>`_
#. `How to use GPG to encrypt stuff <https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff.html>`_
#. `Difference between encrypt/decrypt and sign/verify <https://stackoverflow.com/questions/454048/what-is-the-difference-between-encrypting-and-signing-in-asymmetric-encryption>`_
#. `ASCII Armor Ref 1 <https://en.wikipedia.org/wiki/Binary-to-text_encoding#ASCII_armor>`_
#. `ASCII Armor Ref 2 <https://en.wikipedia.org/wiki/Talk%3AASCII_armor>`_
#. `ASCII Armor Ref 3 <https://lists.gnupg.org/pipermail/gnupg-devel/2011-October/026253.html>`_
#. `Armor and other options <https://www.linuxjournal.com/files/linuxjournal.com/linuxjournal/articles/048/4892/4892s2.html>`_
#. `Exchanging keys <https://www.gnupg.org/gph/en/manual/x56.html>`_
#. `pgp trust <https://www.phildev.net/pgp/gpgtrust.html>`_
#. `key signing <https://security.stackexchange.com/questions/14479/what-does-key-signing-mean>`_
#. `Further reading pgp basics <https://security.stackexchange.com/questions/14479/what-does-key-signing-mean>`_
#. `gpg: WARNING: unsafe enclosing directory permissions on configuration file <https://superuser.com/questions/954509/what-are-the-correct-permissions-for-the-gnupg-enclosing-folder-gpg-warning>`_
