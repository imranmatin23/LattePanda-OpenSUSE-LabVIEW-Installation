#!/bin/sh

printf "\nThis script will install LabVIEW 2019...\n"

# Get location of downloaded files
printf "\nWhere did you download the files from above? Please enter an absolute path such as '/home/imt/Downloads'\n"
read -p ">> " download_loc

# check if path is not empty string
if [ -z "$download_loc" ]
then
  echo "This path is an empty string."
  exit 1
fi
# check if file exist
if [ ! -e "$download_loc" ]
then
  echo "This path does not exist."
  exit 1
fi

printf "Mounting the .iso file...\n"
sudo mkdir /mnt/iso
sudo mount -t iso9660 -o loop $download_loc/lv2019full-linux-mac.iso /mnt/iso

printf "Copying the iso directory to the Desktop...\n"
cp -r /mnt/iso ~/Desktop/iso/

printf "Mounting the Linux LabVIEW .iso file...\n"
cd ~/Desktop/iso/LabVIEW/Linux/
sudo mkdir 2019SP1
sudo mount -t iso9660 -o loop lv2019full-linux.iso 2019SP1/
cd 2019SP1/

printf "Installing LabVIEW...\n"
sudo ./INSTALL

printf "Unmounting and removing all installation packages...\n"
cd ~/Desktop
sudo umount /home/$USER/Desktop/iso/LabVIEW/Linux/2019SP1
sudo umount /mnt/iso
sudo rm -rf /mnt/iso
sudo rm -rf ~/Desktop/iso/

printf "\nThe installation for LabVIEW 2019 is complete. Thank you, goodbye.\n"