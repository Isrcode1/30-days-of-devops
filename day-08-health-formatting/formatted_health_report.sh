#!/bin/bash

clear

echo "============================================="
echo "           SYSTEM HEALTH REPORT"
echo "============================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "---------------------------------------------"

echo ""
echo "[ CPU USAGE ]"
top -bn1 | grep "Cpu(s)"

echo ""
echo "[ MEMORY USAGE ]"
free -h

echo ""
echo "[ DISK USAGE ]"
df -h | grep '^/dev'

echo ""
echo "============================================="
echo "           END OF REPORT"
echo "============================================="
