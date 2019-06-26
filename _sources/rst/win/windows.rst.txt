Windows
=======

Copy folder recursively and exclude certain files
-------------------------------------------------

``robocopy E:\pharrell\enc\ E:\pharrell\enc-copy\ /E /Z /R:5 /W:5 /TBD /NP /V /XF "rec.yuv" "str.bin"``

Tail equivalent on Windows
--------------------------
To get the last 20 lines, open *Windows PowerShell*:

``Get-Content E:\pharrell\enc\hm\hi\Cactus\encoder_lowdelay_P_main\22\console_output.txt -Wait -Tail 20``


