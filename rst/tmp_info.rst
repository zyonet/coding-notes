Temporary stuff
===============

PaperReading SCC Test Sequence GDrive download link:

1. `PaperReading 1280x720 843 frames <https://drive.google.com/file/d/1hYKOEHXmE0SLHkU8OuPtmaIGiGlUq3Uf/view?usp=sharing>`_

2. `PaperReading 1280x720 20frames <https://drive.google.com/file/d/1b8XUbMpjm2z9JC6tOKFUkfAy8LNB_amg/view?usp=sharing>`_



1. generate pgp keypair in iphone
2. export keychain to itunes
3. email to linux
4. import to linux, trust the keys
5. export private key and public key as .asc files, store them in cloud?
6. use sign + encrypt in desktop, decrypt in iphone.

how to delete keys
gpg --delete-secret-keys "User Name"
 gpg --delete-key "User Name"


 ow


to be added to coding notes

2. what is gpg, what is pgp. create pgp key pair in ubuntu, gui and commandline work thru.

ref: https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff.html

3. export pgp public key and private key, send it to other machine via secret channel, import them on target machine, then trust them in command line ``gpg --edit-key "KEY ID"``, KEY ID is typically in the format of "NAME <EMAIL>".

4. use public key to encrypt a file, use private key to decrypt it, the workflow diagram.

1) how to use encrypt/decrypt
method 1
enc: gpg -s --no-tty --always-trust --passphrase "xxxxxxx" -u "WANG Zhenxiang <15113029g@connect.polyu.hk>" tmp.txt 
dec: echo $PASSPHRASE | gpg --batch --yes  --passphrase-fd 0 data_file.txt.gpg

figure out hte meaning, 

-no-tty: https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration-Options.html
--always-trust: https://www.gnupg.org/gph/en/manual/r1554.html

method 2
enc: gpg -o tmp.txt.gpg -e -r "WANG Zhenxiang <15113029g@connect.polyu.hk>" tmp.txt
dec: gpg -o tmp_new_name.txt -d tmp.txt.gpg
method 3: 

Why not just use:
gpg -se -r bob@bob.com file.txt  # you need to make sure you only have one private/public key pair, otherwise you might sign with one private key and encrypt with anthor public key. THi smight seem ok, but sometimes you might just want only one pgp key pair being used.
which signs and encrypts the file. Then when they run:
gpg file.gpg  # it will output file.txt, if you use ``gpg -d file.gpg``, the msg will be displayed on screen, which seems not good.
it will decrypt and display the signature?

figure out how to specify specific private key for signing in the coimmand above?


2) how to use sign/verify
3) diff between the two.

When encrypting, you use their public key to write a message and they use their private key to read it.
When signing, you use your private key to write message's signature, and they use your public key to check if it's really yours.

https://stackoverflow.com/questions/454048/what-is-the-difference-between-encrypting-and-signing-in-asymmetric-encryption


5. install gpg on windows, add to path, run gpg from cmd.
