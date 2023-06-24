#!/bin/bash

#Create a log file to track updates
logfile="/var/log/update-upgrade.log"

#Check if the log file exists, and if not create it
if ! test -e $logfile; then
  touch $logfile
fi

#Write the current date and time to the log file
echo "Date: $(date)" | tee -a $logfile

#Write the results of the update to the log file
echo "Update Results:" | tee -a $logfile
sudo apt update | tee -a $logfile

#Write the results of the upgrade to the log file
echo "Upgrade Results:" | tee -a $logfile
sudo apt upgrade -y | tee -a $logfile

#Write the results of the autoremove to the log file
echo "Autoremove Results:" | tee -a $logfile
sudo apt autoremove -y | tee -a $logfile

#Write the results of the autoclean to the log file
echo "Autoclean Results:" | tee -a $logfile
sudo apt autoclean | tee -a $logfile
