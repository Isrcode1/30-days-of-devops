#!/bin/bash

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "===== SYSTEM HEALTH REPORT ====="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# CPU Load (1 minute average)
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1 | xargs)

# Memory usage percentage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

# Disk usage percentage (root partition)
DISK_USAGE=$(df / | awk 'END{print $5}' | sed 's/%//')

echo "CPU Load (1m avg): $CPU_LOAD"
echo "Memory Usage: $MEMORY_USAGE%"
echo "Disk Usage (/): $DISK_USAGE%"
echo ""

# Status Check
if [ "$MEMORY_USAGE" -gt 80 ] || [ "$DISK_USAGE" -gt 85 ]; then
    echo -e "${RED}WARNING: High resource usage detected!${RESET}"
else
    echo -e "${GREEN}STATUS: System running normally.${RESET}"
fi

echo ""
echo -e "===== END REPORT ====="
