#!/bin/bash

BACKUP_DIR="/mnt/c/Users/folarin/30-days-of-devops/day-26-backup-automation/backups"
RESTORE_DIR="/mnt/c/Users/folarin/30-days-of-devops/day-27-restore-validation/restored"

mkdir -p "$RESTORE_DIR"

LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/*.tar.gz 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "No backup file found."
    exit 1
fi

tar -xzf "$LATEST_BACKUP" -C "$RESTORE_DIR"

echo "Restore completed from: $LATEST_BACKUP"
echo "Files restored to: $RESTORE_DIR"

