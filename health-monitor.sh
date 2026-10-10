#!/bin/bash

# CIT-220 Midterm

# Checks system information on Linux.

log="$HOME/linux-health-monitor.log"


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

while true; do
echo ""
echo "---- Linux System Health Monitor ----"
echo "1. Check system health"
echo "2. View saved checks"
echo "3. Exit"

read -r -p "Enter a number (1-3): " choice || break

if [ "$choice" = "1" ]; then
	Linuxh_check | tee -a "$log"

elif [ "$choice" = "2" ]; then
	if [ -f "$log" ]; then
cat "$log"
else
	echo "No checks saved yet."
fi

elif [ "$choice" = "3" ]; then
	echo "Goodbye!"
break

else 
	echo "Enter a number from 1 to 3."
	fi
done
