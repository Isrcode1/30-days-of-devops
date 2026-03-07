#!/bin/bash

clear

echo "======================================="
echo "        DEVOPS SYSTEM DASHBOARD"
echo "======================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

echo "------ SYSTEM UPTIME ------"
uptime
echo ""

echo "------ CPU USAGE ------"
top -bn1 | grep "Cpu(s)"
echo ""

echo "------ MEMORY USAGE ------"
free -h
echo ""

echo "------ DISK USAGE ------"
df -h | grep '^/dev'
echo ""

echo "------ TOP 5 CPU PROCESSES ------"
ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""

echo "------ RECENT ALERTS ------"
tail -n 5 /mnt/c/Users/folarin/30-days-of-devops/day-16-log-analysis/analysis_report.log 2>/dev/null

echo ""
echo "======================================="
echo "        END OF DASHBOARD"
echo "======================================="
