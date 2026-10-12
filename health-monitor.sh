#!/bin/bash

# CIT-220 Midterm

# Checks system information on Linux.

# Saves checks

log="$HOME/linux-health-monitor.log"

# Checks system health by showing the date, uptime, CPU usage, RAM, and disk space.

Linuxh_check() {
echo "-- System Health -- :D"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo "CPU usage: $(vmstat 1 2 | tail -1 | awk '{print 100-$15}')%"
echo "RAM:"
free -h | head -n 2
echo "Disk:"
df -h /
}

# Shows the menu until the user chooses to exit

while true; do
echo ""
echo "---- Linux System Health Monitor ----"
echo "1. Check system health"
echo "2. View saved checks"
echo "3. Exit"

# Asks the user for a choice

read -r -p "Enter a number (1-3): " choice || break

# Shows option 1

if [ "$choice" = "1" ]; then
	Linuxh_check | tee -a "$log"

# Shows option 2

elif [ "$choice" = "2" ]; then
	if [ -f "$log" ]; then
cat "$log"
else
	echo "No checks saved yet."
fi

# Shows option 3

elif [ "$choice" = "3" ]; then
	echo "Goodbye!"
break

# Anything else other than choosing 1-3 is invalid

else 
	echo "Enter a number from 1 to 3."
	fi
done
