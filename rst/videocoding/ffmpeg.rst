ffmpeg
======

Merge Audio and Video
---------------------

.. code-block:: bash

    e.g.
    ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac -strict experimental output1.mp4
    ffmpeg -i video.mp4 -i audio.mp4 -c:v copy -c:a aac -strict experimental output2.mp4

ref: https://superuser.com/questions/277642/how-to-merge-audio-and-video-file-in-ffmpeg

