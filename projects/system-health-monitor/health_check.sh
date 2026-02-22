#!/bin/bash

echo "===== SYSTEM HEALTH REPORT ====="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

echo "Uptime:"
uptime
echo ""

echo "CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

echo "Memory Usage:"
free -h
echo ""

echo "Disk Usage:"
df -h
echo ""

echo "===== END REPORT ====="
