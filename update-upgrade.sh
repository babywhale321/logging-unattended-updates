#!/bin/bash

# Update package list
apt-get update

# Upgrade all installed packages
apt-get upgrade -y

# Check if a reboot is required
if [[ -f /var/run/reboot-required ]]; then
    # Get the reason for the reboot
    reboot_reason=$(cat /var/run/reboot-required.pkgs)

    # Write a message to the log file
    if [[ ! -f /var/log/update-upgrade.log ]]; then
        # Create the log file
        touch /var/log/update-upgrade.log
    fi
    echo "System will reboot at $(date) for the following reason: $reboot_reason" >> /var/log/update-upgrade.log

    # Reboot the system
    reboot
else
    # No reboot required
    if [[ ! -f /var/log/update-upgrade.log ]]; then
        # Create the log file
        touch /var/log/update-upgrade.log
    fi
    echo "No reboot required" >> /var/log/update-upgrade.log
    echo "No reboot was needed at $(date)" >> /var/log/update-upgrade.log
fi
