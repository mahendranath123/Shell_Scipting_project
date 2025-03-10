#!/bin/bash

# Define color variables for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'  # No Color

# Log file to store output (ensure proper permissions on /var/log)
LOG_FILE="/var/log/disk_usage_monitor.log"

# Function to log messages with a timestamp
log_message() {
    local message="$1"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
}

# Function to display a modern, styled banner
show_banner() {
    clear  # Clear the terminal for a fresh start
    echo -e "${CYAN}╔══════════════════════════════════════════════════╗"
    echo -e "║          Disk Usage Monitor Tool                 ║"
    echo -e "║   Monitoring disk space and alerting on high usage ║"
    echo -e "╚══════════════════════════════════════════════════╝${NC}"
}

# Display the banner
show_banner
sleep 2  # Pause for effect

# Set disk usage threshold percentage
THRESHOLD=80

# Check disk usage and print warnings if usage exceeds the threshold
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r output; do
    usage=$(echo "$output" | awk '{ print $1 }' | cut -d'%' -f1)
    partition=$(echo "$output" | awk '{ print $2 }')

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo ""
        echo -e "${RED}╔══════════════════════════════════════════════════╗${NC}"
        echo -e "${RED}║           ALERT: High Disk Usage!                ║${NC}"
        echo -e "${RED}╠══════════════════════════════════════════════════╣${NC}"
        printf "${RED}║ Partition: %-35s ║\n" "$partition"
        printf "${RED}║ Usage:     %-35s ║\n" "${usage}%"
        echo -e "${RED}║ Action:    Clean up or scale storage space       ║${NC}"
        echo -e "${RED}╚══════════════════════════════════════════════════╝${NC}"
        echo ""
        sleep 1  # Brief pause for readability

        log_message "WARNING: Disk usage on $partition is at ${usage}%"
    else
        echo -e "${GREEN}Disk usage on $partition is healthy at ${usage}%${NC}"
    fi
done

# Optionally: Log that the disk usage check is complete
log_message "Disk usage check completed."

