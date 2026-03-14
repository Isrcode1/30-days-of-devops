#!/bin/bash

SOURCE_DIR="/mnt/c/Users/folarin/30-days-of-devops"
BACKUP_DIR="/mnt/c/Users/folarin/30-days-of-devops/day-26-backup-automation/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="devops_backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

echo "Backup completed: $BACKUP_DIR/$BACKUP_FILE"

