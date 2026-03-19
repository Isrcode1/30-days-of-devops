#!/bin/bash

set -euo pipefail

LOG_FILE="log.txt"

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

greet_user() {
    read -p "Enter your name: " name
    echo "Hello, $name!"
    log_action "User greeted: $name"
}

system_info() {
    echo "System Uptime:"
    uptime
    echo "Disk Usage:"
    df -h
    log_action "Viewed system info"
}

backup_file() {
    read -p "Enter file to backup: " file

    if [ ! -f "$file" ]; then
        echo "File does not exist!"
        return
    fi

    backup_dir="backups/backup_$(date +%F)"
    mkdir -p "$backup_dir"

    cp "$file" "$backup_dir/"
    echo "Backup successful → $backup_dir"

    log_action "Backup created for $file"
}

generate_password() {
    read -p "Enter password length: " length

    if ! [[ "$length" =~ ^[0-9]+$ ]]; then
        echo "Invalid number"
        return
    fi

    password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c "$length")
    echo "Generated Password: $password"

    log_action "Generated password of length $length"
}

show_logs() {
    echo "==== LOGS ===="
    cat "$LOG_FILE"
}

menu() {
    while true
    do
        echo ""
        echo "====== DEVOPS TOOL ======"
        echo "1. Greet User"
        echo "2. System Info"
        echo "3. Backup File"
        echo "4. Generate Password"
        echo "5. Show Logs"
        echo "6. Exit"
        echo "========================="

        read -p "Choose an option: " choice

        case $choice in
            1) greet_user ;;
            2) system_info ;;
            3) backup_file ;;
            4) generate_password ;;
            5) show_logs ;;
            6) echo "Goodbye!"; exit ;;
            *) echo "Invalid option" ;;
        esac
    done
}

menu
