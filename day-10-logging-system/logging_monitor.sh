#!/bin/bash

LOG_DIR="logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/system_report_$TIMESTAMP.log"

mkdir -p $LOG_DIR

{
echo "================================================="
echo "               SYSTEM REPORT"
echo "================================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "-------------------------------------------------"

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
echo "[ TOP 5 CPU PROCESSES ]"
ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo ""
echo "[ TOP 5 MEMORY PROCESSES ]"
ps -eo pid,cmd,%mem,%cpu --sort=-%mem | head -n 6

echo ""
echo "================================================="
echo "               END OF REPORT"
echo "================================================="

} | tee $LOG_FILE

echo ""
echo "Report saved to $LOG_FILE"
