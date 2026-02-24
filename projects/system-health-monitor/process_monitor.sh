#!/bin/bash

echo "===== PROCESS MONITOR REPORT ====="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

echo "Top 5 CPU Consuming Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""

echo "Top 5 Memory Consuming Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo ""

echo "===== END REPORT ====="
