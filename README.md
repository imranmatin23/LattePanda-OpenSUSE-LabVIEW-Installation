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
    * Navigate with (TAB, ENTER, arrow keys).
    * Select [Next] to accept license and English format.
    * Set partitioning.
        * Select [Create Partition Setup...].
        * Select the internal hard disk (/dev/mmcblk0).
        * Select [Use Entire Hard Disk].
        * Select [Next] to accept partitioning.
    * Select Region: USA and Time Zone: Pacific (Los Angeles) then select [Next].
    * Select [Next] to accept default User Interface.
    * Set user credentials then Select [Next].
        * User's Full Name: imt
        * Username: imt
        * Password: IMT password
        * Leave all other defaults.
        * Select Use this password for system administrator
        * Select Automatic Login
    * Change installation settings to allow SSH.
        * Select [Change...].
        * Select [Firewall and SSH...].
        * Enable SSH Service and open SSH port.
        * Select [Install] to continue installation.

17. Remove installation media after installation is complete.

18. Log into the system.

19. Disable the internal display output called DSI-1. Press the lizard icon in the bottom left corner to open the start menu and and then search for "Displays". Disable the internal display output called DSI-1. You can also disable it by running the following command in your terminal.
    ```
    xrandr --output DSI-1 --off
    ```

20. Update the system. This may take a long time, therefore in can be put off until the end if desired.
    ```
    sudo zypper refresh
    sudo zypper update
    ```

21. Enable SSH for the LattePanda.
    ```
    sudo zypper in openssh
    systemctl status sshd
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

3. Install LabVIEW using installation script located in the this repository. Enter the path to the download and accept all prompts.
    ```
    cd ~/Desktop/<repo>
    sh install_labview.sh
    ```

4. Check if LabVIEW has been installed by opening the start menu at the bottom left corner and searching for LabVIEW.


5. If Step 4 opens LabVIEW correctly, then the installation has succeeded.


## Extra Notes
* Follow the links below to download OpenSUSE Leap 42.3 DVD installation files independently. Note, these links may lead to newer releases of the software and may cause issues during installation.
    * Download OpenSUSE Leap 42.3 DVD from this [link](http://cdimage.debian.org/mirror/opensuse.org/distribution/leap/42.3/iso/).
* Download LabVIEW 2019. You must have a valid license with National Instruments for the LabVIEW software.
    *  Download lv2019full-linux-mac.iso
* Refer to this [guide](https://cloudyday.tech.blog/2018/08/19/lattepanda/) if you need visual help for installing OpenSUSE.
* If you want to set up a Static IP address on OpenSUSE Leap 42.3 follow the steps below. You can refer to these [this guide](https://sahlitech.com/configure-static-ip-on-suse-linux/) and [this video](https://www.youtube.com/watch?v=5QneCF9XD4Y) for help as well.
    * Change the X in all of the IP addresses 192.168.X.Y to the value that is currently there for your IP Address (ip address can be found using `ip address`)
    * Change the Y in all of the IP addresses 192.168.X.Y to what you would like for this system

    * Step 1
    ```
    sudo vim /etc/sysconfig/network/ifcfg-eth0
    # Change BOOTPROTO to ‘static’
    # Change IPADDR to ‘192.168.X.Y’
    # Change NETMASK to ’255.255.255.0’
    ```

    * Step 2
    ```
    sudo vim /etc/sysconfig/network/config
    # Change NETCONFIG_DNS_STATIC_SERVERS to “8.8.8.8, 8.8.4.4, 192.168.X.1”
    ```

    * Step 3
    ```
    sudo vim /etc/sysconfig/network/routes
    # Add the line ‘default 192.168.X.1 --’
    ```
    
    * Step 4
    ```
    sudo vim /etc/resolv.conf
    # Add the line ‘nameserver 192.168.X.1’
    ```

    * Step 5
    ```
    systemctl restart wickedd wicked
    sudo reboot
    ```