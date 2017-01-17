#!/bin/bash

#Request sudo permissions
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
#Get Updage
sudo apt-get update

#Get Firefox for wiki
sudo apt-get install firefox

#Get File Explore
sudo apt-get install nemo

#Get rar
sudo apt-get install rar

#Get Gpac
sudo apt-get install gpac

#Get prerequisites
sudo apt-get install supervisor xvfb fluxbox x11vnc websockify

#Copy supervisord configuration to proper configuration directory
cp supervisord.conf ${HOME}/.config/supervisord.conf

#Create the proper directory for the script
sudo mkdir /opt/c9vnc

#Make sure that the runners folder exists
mkdir ${HOME}/workspace/.c9/runners

#Copy the C9 runner to the C9 watch folder
cp c9vnc.run ${HOME}/workspace/.c9/runners/c9vnc.run

#Copy the run script to proper /opt/ directory
sudo cp run.sh /opt/c9vnc/c9vnc.sh

#Copy the run script to proper /opt/ directory
sudo cp vps.gif /home/ubuntu/vps.gif

#Copy the run script to proper /opt/ directory
sudo cp capture.sh /home/ubuntu/capture.sh

#Copy the run script to proper /opt/ directory
sudo cp capture2.sh /home/ubuntu/capture2.sh

#Copy the run script to proper /opt/ directory
sudo cp uninstall.sh /opt/c9vnc/uninstall.sh

#Support password for x11vnc
sudo cp x11vncrun.sh /opt/c9vnc/x11vncrun.sh

#Clone noVNC into proper /opt/ directory
git clone git://github.com/kanaka/noVNC /opt/noVNC/

#Set up password for x11vnc
echo
echo
while true; do
    read -p "Do you wish to set password for x11vnc? (not recommended for public workspaces!) " yn
    case $yn in
#        [Yy]* ) x11vnc -storepasswd; break;; Coming later
        [Yy]* ) (echo Coming later); break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
