#!/bin/bash
echo ""
echo "------ DISK ALERT CHECK ------"
DISK_USAGE=$(df / | awk 'END{print $5}' | sed 's/%//')

echo "Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt 50 ]; then
    echo "WARNING: Disk usage is high!"
else
    echo "Disk usage is normal."
fi
