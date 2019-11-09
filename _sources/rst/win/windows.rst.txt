Windows
=======

Visual Studio Customization
---------------------------

ref: https://stackoverflow.com/questions/22380594/hiding-platform-toolset-in-solution-explorer-for-c-projects

Search a file called ``Microsoft.Cpp.Default.props`` in the computer and open the right one.

For example, in visual studio 2019, it locates at

.. code-block:: bash
    
    C:\Program Files (x86)\Mircosoft Visual Studio\2019\Profesional\MSBuild\Microsoft\VC\v150
    C:\Program Files (x86)\Mircosoft Visual Studio\2019\Profesional\MSBuild\Microsoft\VC\v160

Do modifications as you need:

.. code-block:: bash

    <_PlatformToolsetShortNameFor_v140_xp Condition="'$(_PlatformToolsetShortNameFor_v140_xp)' == 'customized by aliwang at tencent'">Visual Studio 2015 - Windows XP</_PlatformToolsetShortNameFor_v140_xp>
    <!-- <_PlatformToolsetShortNameFor_v140_xp Condition="'$(_PlatformToolsetShortNameFor_v140_xp)' == ''">hahha i added these hah Visual Studio 2015 - Windows XP</_PlatformToolsetShortNameFor_v140_xp> -->


.. Website for new version is shown in :numref:`new_gitbook_website_capture`,

.. .. _new_gitbook_website_capture:
.. figure:: ../../images/gitbook-now.png
   :scale: 20%
   :alt: gitbook_now
   Screen Grab for Website of new GitBook

Copy folder recursively and exclude certain files
-------------------------------------------------

``robocopy E:\pharrell\enc\ E:\pharrell\enc-copy\ /E /Z /R:5 /W:5 /TBD /NP /V /XF "rec.yuv" "str.bin"``

Tail equivalent on Windows
--------------------------
To get the last 20 lines, open *Windows PowerShell*:

``Get-Content E:\pharrell\enc\hm\hi\Cactus\encoder_lowdelay_P_main\22\console_output.txt -Wait -Tail 20``

Visual Studio
-------------

`Breakpoints will not currently be hit in visual studio <https://www.codeproject.com/Questions/260627/Breakpoint-will-not-currently-be-hit-No-symbols-lo>`_

Solution: clean solution and build from scratch.

Reverse mouse wheel scroll
--------------------------
`How to reverse mouse wheel scrolling <https://www.windowscentral.com/how-reverse-scrolling-direction-windows-10>`_


