#!/bin/bash

#Create a log file to track updates
logfile="/var/log/update-upgrade.log"

#Check if the log file exists, and if not create it
if [ ! -e "$logfile" ] ; then
   touch "$logfile"
fi

#Write the current date and time to the log file
echo -e "\033[1mDate: $(date)\033[0m" >> "$logfile"

#Write the results of the update to the log file
echo -e "\033[1mUpdate Results:\033[0m" >> "$logfile"
sudo apt update -y | tee -a "$logfile"

#Write the results of the upgrade to the log file
echo -e "\033[1mUpgrade Results:\033[0m" >> "$logfile"
sudo apt upgrade -y | tee -a "$logfile"

#Write the results of the autoremove to the log file
echo -e "\033[1mAutoremove Results:\033[0m" >> "$logfile"
sudo apt autoremove -y | tee -a "$logfile"

#Write the results of the autoclean to the log file
echo -e "\033[1mAutoclean Results:\033[0m" >> "$logfile"
sudo apt autoclean | tee -a "$logfile"

if [ -f /var/run/reboot-required ]; then
  echo -e "\033[1mA reboot was needed on $(date)\033[0m" | tee -a "$logfile"
  sudo reboot
else
  echo -e "\033[1mNo reboot was needed on $(date)\033[0m" | tee -a "$logfile"
fi
