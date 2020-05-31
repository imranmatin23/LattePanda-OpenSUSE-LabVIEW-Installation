# OpenSUSE Leap 42.3 and LabVIEW 2019 Installation on LattePanda Steps

This is a guide to installing OpenSUSE Leap 42.3 and LabVIEW 2019 onto your LattePanda. Note that in this guide, local computer refers to the computer that you use regularly and LattePanda will refer to your actual LattePanda.

### Prerequisites
* Have 16GB+ of free space on your local computer.
* Have a USB with 8GB+ space.
* USB Keyboard and USB Mouse.
* HDMI Cord.
* Ethernet cable
* Ethernet network connection.
* USB Wall Adapter with up to 2A Output and MicroUSB power cord.

## Section 1: Installing OpenSUSE Leap 42.3

### Section 1.1: Perform these steps on your local computer.
1. Download OpenSUSE Leap 42.3 DVD iso from Microsoft OneDrive.

2. Install BalenaEtcher for your local computer OS from this [link](https://www.balena.io/etcher/). It will be used to burn the OpenSUSE .iso image onto the USB.

3. Insert your USB into your local computer. 

4. Open BalenaEtcher. Ignore the popup that occurs by pressing ignore if it shows up. Press *Select image* and locate the OpenSUSE .iso that you downloaded in Step 1. Press *Select target* and locate the USB drive that you have inserted (It may be /dev/disk2 or the name of the disk, but confirm the size of the disk matches to make sure). Then select *Flash*.

    *  NOTE: If the USB does not show up when you select *Select Target*, you must erase and reformat the USB to FAT32 first. Once this is done, repeat Step 4.

    * NOTE: Once BalenaEtcher finishes with USB, an error about the USB may come up saying *"The disk you inserted was not readable by this computer."* Go ahead and ignore it by pressing ignore.

5. Remove the USB from your local computer.

### Section 1.2: Perform these steps on your LattePanda.
1. Insert your keyboard into the USB 2.0 port (black) and mouse into the USB 3.0 port (blue).

2. Insert the USB with Ubuntu into the USB 2.0 port (black).

3. Plug in your HDMI cord.

4. Plug in your Ethernet cable. 

5. Plug in the microUSB power cord. When plugged in, you should see the red LED indicator light up on the underside of the board. This means that the LattePanda is initializing. Wait patiently for a few seconds until the LED light goes out.

6. When the LED indicator turns off then begin this step. First press the power button once (top white button farther from the corner of the board) to turn on the LattePanda. You should see the LED indicator light up again.

7. Continually tap ESC upon boot up until you enter the BIOS. If you miss the BIOS screen and go into the current OS, shut down the computer by unplugging the power cord and repeat Steps 5 to 7.

8. Navigate to the *Boot* tab in the BIOS screen using your keyboard.

9. Navigate to the *Machine Status AC/Battery In* setting to disable the power buttons and allow for the LattePanda to boot automatically when provided power. Press enter and select the *Power On* option.

10. Navigate to the *Save & Exit* tab and select *Save Changes and Reset*. When the computer begins to restart continually tap ESC upon boot up until you enter the BIOS.

11. Navigate to the *Save & Exit* tab. Navigate to the *Boot Override* section below on the same tab, and select the name of your USB device (Example: UEFI: SanDisk Partition 1) to boot from the USB drive you inserted.

12. Upon the OpenSUSE start up, press `e` to get to Minimum Emacs-like screen editor.

13. Change the line `linuxefi /boot/x86_64/loader/linux splash=silent` to `linuxefi /boot/x86_64/loader/linux splash=silent textmode=1`.

14. Press F10 to begin installation process.

15. When you see green loading bars, press the UP arrow to get to terminal/YAST2 installer.

16. Follow on-screen installation instructions:
    - Navigate with (TAB, ENTER, arrow keys).
    - Select [Next] to accept license and English format.
    - Set partitioning.
        - Select [Create Partition Setup...].
        - Select the internal hard disk (/dev/mmcblk0).
        - Select [Use Entire Hard Disk].
        - Select [Next] to accept partitioning.
    - Select Region: USA and Time Zone: Pacific (Los Angeles) then select [Next].
    - Select [Next] to accept default User Interface.
    - Set user credentials then Select [Next].
        - Enter information.
        - Leave all other defaults.
        - Allow short password if desired.
    - Change installation settings to allow SSH.
        - Select [Change...].
        - Select [Firewall and SSH...].
        - Enable SSH Service and open SSH port.
        - Select [Install] to continue installation.

17. Remove installation media after installation is complete.

18. Log into the system.

19. Disable the internal display output called DSI-1. Open a terminal by either right-clicking on the Desktop and opening one or using the start menu in the bottom left corner. NOTE: You can also fix this in the GUI by pressing opening the start menu and searching for "Displays". Then disable the internal display output called DSI-1 by running the following command.
```
xrandr --output DSI-1 --off
```

20. Update the system.
```
sudo zypper refresh
sudo zypper update
```

21. Enable SSH for the LattePanda.
```
which sshd
sudo zypper in openssh
cat /etc/sysconfig/SuSEfirewall2 | grep sshd
system ctl status sshd
systemctl enable sshd
```

22. Congrats you have now installed OpenSUSE successfully.




## Section 2: Installing LabVIEW 2019

### Section 2.1: Perform these steps on your LattePanda.
1. Download LabVIEW 2019 into your `~/Downloads` folder from Microsoft OneDrive. You must have a valid license with National Instruments for the LabVIEW software.

2. Execute the command below to install the Linux command git.
    ```
    sudo zypper in git
    ```

3. Clone this repository.
    ```
    cd ~/Desktop
    git clone <repo>
    ```

3. Install LabVIEW using installation script located in the this repository.
    ```
    cd ~/Desktop/<repo>
    sh install_labview.sh
    ```

4. Check if LabVIEW has been installed. Either open LabVIEW on the LattePanda GUI or check if the command below runs in the terminal. 
    ```
    ./labview
    ```

5. If Step 4 opens LabVIEW correctly, then the installation has succeeded.


## Extra Notes
* Follow the links below to download OpenSUSE Leap 42.3 DVD installation files independently. Note, these links may lead to newer releases of the software and may cause issues during installation.
    * Download OpenSUSE Leap 42.3 DVD from this [link](http://cdimage.debian.org/mirror/opensuse.org/distribution/leap/42.3/iso/).
* Download LabVIEW 2019. You must have a valid license with National Instruments for the LabVIEW software.
    *  Download lv2019full-linux-mac.iso
* Refer to this [guide](https://cloudyday.tech.blog/2018/08/19/lattepanda/) if you need visual help for installing OpenSUSE.
* If you want to set up a Static IP address on OpenSUSE Leap 42.3 follow [this guide](https://docs.google.com/document/d/1hqPk9m53AnPmp_MdRJmawxGa44c2uMKm1Z9Y6t6t1y8/edit?usp=sharing)