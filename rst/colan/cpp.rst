.. _cpp-notes:



###
Cpp
###

.. topic:: Overview

    This page has some cpp notes.


    :Date: |today|
    :Author: **aliwang**


.. contents::
    :depth: 3


Multithread Synchronization
###########################

What
****
Thread synchronization is defined as a mechanism which ensures that two or more concurrent processes or threads do not simultaneously execute some particular program segment known as critical section. Processes’ access to critical section is controlled by using synchronization techniques. When one thread starts executing the critical section (serialized segment of the program) the other thread should wait until the first thread finishes. If proper synchronization techniques are not applied, it may cause a race condition where the values of variables may be unpredictable and vary depending on the timings of context switches of the processes or threads.

Ref
***

1. https://www.geeksforgeeks.org/mutex-lock-for-linux-thread-synchronization/
2. https://blog.csdn.net/s_lisheng/article/details/74278765

Tools
#####

cppcheck
********

`cppcheck homepage <http://cppcheck.sourceforge.net/>`_

Check unused c++ function in visual studio solution
---------------------------------------------------

In Windows Powershell,

.. code-block:: bash

    cppcheck --project=foobar.sln --enable=style,unusedFunction
