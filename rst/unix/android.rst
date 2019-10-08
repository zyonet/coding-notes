Android
=======

Pull file from Mobile to Mac in Terminal
----------------------------------------

.. code-block:: bash

    # list devices attached on macos
    adb devices
    # ```
    # List of devices attached
    # 9PSGTW8TLBQ4MF5S        device
    # ```

    adb -s 9PSGTW8TLBQ4MF5S shell
    # device id has been used in the line above, in other way,
    # you can use the command below
    adb -d shell
    # -d - Direct an adb command to the only attached USB device. Returns an error when more than one USB device is attached.
    # -e - Direct an adb command to the only running emulator. Returns an error when more than one emulator is running.

    # after you have entered the adb shell, you can browser files in mobile phone.
    # if you want to pull files, no need to enter adb shell, just need to know the path and use the command below
    adb pull /sdcard/Tencent/imsdklogs/com/tencent/now/QAVSDK_20191008.log ~/Downloads 
    