# logging-unattended-updates

A script that can be ran with crontab to output a log file after updating/upgrading.

# Workflow

1, updates, upgrades, autoremove, autoclean.

2, check if a reboot is required.

3, create a log file then write to the log file about what has been updated.

3, If nothing is to be updated a log file is created and written to with a timestamp.

4, reboots the system if required.
