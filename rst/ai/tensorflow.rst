Tensorflow
==========

How to compile Tensorflow to making use of SSE4.2 and AVX
---------------------------------------------------------

What are SSE4.2 and AVX
~~~~~~~~~~~~~~~~~~~~~~~
Wikipedia has a good explanation about
`SSE4.2 <https://en.wikipedia.org/wiki/SSE4>`_ and
`AVX <https://en.wikipedia.org/wiki/Advanced_Vector_Extensions>`_.

You may think about them as a set of some additional instructions for a
computer to use multiple data points against a single instruction to perform
operations which may be naturally parallelized (for example adding two arrays).

Both SSE and AVX are implementation of an abstract idea of
SIMD (Single instruction, multiple data),
which is a class of parallel computers in Flynn's taxonomy.
It describes computers with multiple processing elements that perform
the same operation on multiple data points simultaneously.
Thus, such machines exploit data level parallelism,
but not concurrency:
there are **simultaneous (parallel) computations**,
but **only a single process (instruction) at a given moment**.

How do these SSE4.2 and AVX improve CPU computations for TF tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
They allow a more efficient computation of various vector
(matrix/tensor) operations.

How to make Tensorflow compile using the two libraries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You need to have a binary which was compiled to take advantage of
these instructions. The easiest way is to compile it yourself.

.. code-block:: bash

    bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2 --config=cuda -k //tensorflow/tools/pip_package:build_pip_package


How to avoid run configure again and again
------------------------------------------
Problem description
~~~~~~~~~~~~~~~~~~~
If you just configure tensorflow using ./configure and set CUDA support to YES,
tensorflow is successfully built. You can make some change in source code
and rebuild using command:

.. code-block:: bash

    bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package

Build after you reboot ubuntu/mac, and try to build tensorflow using
above command, it requires you to reconfigure tensorflow, and rebuild,
which takes such a long time. error message is as follows:

.. code-block:: bash

    ERROR: Building with --config=cuda but TensorFlow is not configured to
    build with GPU support. Please re-run ./configure and
    enter 'Y' at the prompt to build with GPU support.
    ERROR: no such target '@local_config_cuda//crosstool:toolchain':
    target 'toolchain' not declared in package 'crosstool' defined by
    /home/wolfson/.cache/bazel/_bazel_wolfson/41eaf6c788f09c81cffb135517d04fa2/
    external/local_config_cuda/crosstool/BUILD.

Fixation
~~~~~~~~

Export env variable before first run ``./configure`` for Tensorflow.

Ubuntu example
^^^^^^^^^^^^^^
.. code-block:: bash

    export TF_NEED_CUDA=1
    export TF_CUDA_VERSION=8.0
    export CUDA_TOOLKIT_PATH=/usr/local/cuda
    export TF_CUDNN_VERSION=5.1.5
    export CUDNN_INSTALL_PATH=/usr/lib/aarch64-linux-gnu/
    export TF_CUDA_COMPUTE_CAPABILITIES=5.3

You need to add them into ``~/.bashrc``, then ``source ~/.bashrc`` to save it.

macOS example
^^^^^^^^^^^^^

.. code-block:: bash

    export TF_NEED_CUDA=1
    export TF_CUDA_VERSION=8.0
    export CUDA_TOOLKIT_PATH=/usr/local/cuda
    export TF_CUDNN_VERSION=6
    export CUDNN_INSTALL_PATH=/usr/local/cuda
    export TF_CUDA_COMPUTE_CAPABILITIES=5.2

If you are using zsh shell, you need to open ``~/.zshrc`` file under your
home directory, then add above exports to the file, save and exit. If not using
zsh shell, you can just add them in ``~/.bash_profile``.

.. tip:: You can use ``printenv`` to check the existing env vars in your machine.
