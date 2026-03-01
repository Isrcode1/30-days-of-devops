#!/bin/bash

LOG_DIR="/mnt/c/Users/folarin/30-days-of-devops/day-10-logging-system/logs"
RETENTION_DAYS=7

echo "========================================"
echo "        LOG ROTATION SYSTEM"
echo "========================================"
echo "Checking for logs older than $RETENTION_DAYS days..."
echo ""

# List old files before deleting
OLD_LOGS=$(find $LOG_DIR -type f -name "*.log" -mtime +$RETENTION_DAYS)

if [ -z "$OLD_LOGS" ]; then
    echo "No old logs found."
else
    echo "Deleting the following logs:"
    echo "$OLD_LOGS"
    find $LOG_DIR -type f -name "*.log" -mtime +$RETENTION_DAYS -delete
    echo ""
    echo "Old logs deleted successfully."
fi

echo ""
echo "Log cleanup complete."
echo "========================================"
