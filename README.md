# OpenSUSE Leap 42.3 and LabVIEW 2019 Installation on LattePanda Steps

This is a guide to installing OpenSUSE Leap 42.3 and LabVIEW 2019 onto your LattePanda.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them. These downloads can be either on your local computer
and then use SCP to transfer them onto the remote computer, or can be downloaded straight onto the remote computer.

1. Download OpenSUSE Leap 42.3 DVD from this [link](http://download.opensuse.org/ports/ppc/distribution/leap/42.3/iso/).
2. Download LabVIEW 2019.
3. Download the patch for LabVIEW 2019.
4. Install BalenaEtcher from this [link](https://www.balena.io/etcher/).

### Installing OpenSUSE Leap 42.3

A step by step guide that tell you how to install OpenSUSE Leap 42.3. Make sure ethernet is plugged in.

1. Burn the .iso file onto the USB using BalenaEtcher.
2. Insert the USB into the LattePanda.
3. Upon startup of LattePanda press ESC to get to BIOS.
4. Select the USB media as the boot option in boot override.
5. Refer to this [guide](https://cloudyday.tech.blog/2018/08/19/lattepanda/) if you need visual help.
6. Upon the OpenSUSE start up, press ‘e’ to get to Minimum Emacs-like screen editor.
7. Change the line `linuxefi /boot/x86_64/loader/linux splash=silent` to `linuxefi /boot/x86_64/loader/linux splash=silent textmode=1`.
8. Press F10 to begin installation process.
9. When you see green loading bars, press the UP arrow to get to terminal/YAST2 installer.
10. Follow on-screen installation instructions:
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
11. Remove installation media after installation is complete.
12. Enable SSH.
```
which sshd
sudo zypper in openssh
cat /etc/sysconfig/SuSEfirewall2 | grep sshd
system ctl status sshd
systemctl enable sshd
```
13. Update system.
```
sudo zypper refresh
sudo zypper update
```
14. Disable second display output called DSI-1.
```
xrandr --output DSI-1 --off
```


### Installing LabVIEW 2019

A step by step guide that tell you how to install LabVIEW 2019.

1. Download LabVIEW iso and patch.
```
scp LabVIEW2019SP1f1Patch.dmg [USER]@[IP_ADDRESS]:/home/[USER]]/Downloads
scp lv2019full-linux-mac.iso [USER]@[IP_ADDRESS]:/home/[USER]/Downloads
```
2. Install LabVIEW using installation script.
```
sh install_labview.sh
```


![Example]()

TODO:
End with an example of getting some data out of the system or using it for a little demo

## Errors

* None

### System Notes

* None

## Built With

* OpenSUSE Leap 42.3 - The OS used
* LabVIEW - LabVIEW application software

## Contributing

* None

## Versioning

* None

## Authors

* **Imran Matin** - [Github Profile](https://github.com/imranmatin23)

## License

* None

## Acknowledgments

* None

