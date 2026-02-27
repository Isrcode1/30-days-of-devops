#!/bin/bash

CPU_THRESHOLD=70
MEM_THRESHOLD=70

LOG_DIR="logs"
mkdir -p $LOG_DIR

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ALERT_LOG="$LOG_DIR/alerts_$TIMESTAMP.log"

echo "========================================"
echo "        SMART SYSTEM MONITOR"
echo "========================================"
echo "Date: $(date)"
echo ""

# Get CPU usage (calculate active usage)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE_INT=${CPU_USAGE%.*}

echo "CPU Usage: $CPU_USAGE%"

if [ "$CPU_USAGE_INT" -gt "$CPU_THRESHOLD" ]; then
    echo "⚠ WARNING: CPU usage is above $CPU_THRESHOLD%" | tee -a $ALERT_LOG
fi

echo ""

# Get Memory usage percentage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
MEM_USAGE_INT=${MEM_USAGE%.*}

echo "Memory Usage: $MEM_USAGE%"

if [ "$MEM_USAGE_INT" -gt "$MEM_THRESHOLD" ]; then
    echo "⚠ WARNING: Memory usage is above $MEM_THRESHOLD%" | tee -a $ALERT_LOG
fi

echo ""
echo "========================================"
