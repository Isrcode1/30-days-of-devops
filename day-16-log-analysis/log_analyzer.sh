#!/bin/bash

# Directory containing centralized logs
LOG_DIR="/mnt/c/Users/folarin/30-days-of-devops/day-15-centralized-logging/central-logs"

REPORT_FILE="analysis_report.log"

ERROR_THRESHOLD=5
WARNING_THRESHOLD=10

echo "========================================" >> $REPORT_FILE
echo "Log Analysis Run: $(date)" >> $REPORT_FILE

# Count errors and warnings
ERROR_COUNT=$(grep -i "error" $LOG_DIR/*.log 2>/dev/null | wc -l)
WARNING_COUNT=$(grep -i "warning" $LOG_DIR/*.log 2>/dev/null | wc -l)

echo "Total Errors: $ERROR_COUNT" >> $REPORT_FILE
echo "Total Warnings: $WARNING_COUNT" >> $REPORT_FILE

# Alert logic
if [ "$ERROR_COUNT" -gt "$ERROR_THRESHOLD" ]; then
    echo "🚨 ALERT: Error threshold exceeded!" >> $REPORT_FILE
fi

if [ "$WARNING_COUNT" -gt "$WARNING_THRESHOLD" ]; then
    echo "⚠️ ALERT: Warning threshold exceeded!" >> $REPORT_FILE
fi

echo "Analysis completed." >> $REPORT_FILE
echo "" >> $REPORT_FILE
