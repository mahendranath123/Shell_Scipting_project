#!/bin/bash

# Define color codes for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'  # No Color

# Log file to store output (saved in the current directory)
OUTPUT_FILE="./network_check_output.txt"

# Function to display a professional ASCII logo and tool information
display_logo() {
    clear  # Clear the terminal for clean output
    echo -e "${CYAN}╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║            N E T W O R K   C H E C K             ║${NC}"
    echo -e "${CYAN}║   A simple tool to verify network connectivity     ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Function to check network connectivity by pinging a host
check_network() {
    # Check if the host is reachable by sending one ping packet
    if ping -c 1 "$HOST" &> /dev/null; then
        echo ""
        echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
        printf "${GREEN}║ Host:   %-30s ║\n" "$HOST"
        printf "${GREEN}║ Status: %-30s ║\n" "Reachable"
        echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
        echo "$(date): $HOST is reachable" | tee -a "$OUTPUT_FILE"
    else
        echo ""
        echo -e "${RED}╔════════════════════════════════════════════╗${NC}"
        printf "${RED}║ Host:   %-30s ║\n" "$HOST"
        printf "${RED}║ Status: %-30s ║\n" "Not Reachable"
        echo -e "${RED}╚════════════════════════════════════════════╝${NC}"
        echo "$(date): $HOST is not reachable" | tee -a "$OUTPUT_FILE"
    fi
}

# Main script execution

# Display the header/logo
display_logo

# Prompt the user to input the host to check
read -p "Enter the host you want to check (e.g., google.com): " HOST

# Validate the user input; if empty, default to google.com
if [ -z "$HOST" ]; then
    HOST="google.com"
    echo -e "${YELLOW}No host entered. Using default: google.com${NC}"
fi

# Optionally pause before checking
sleep 1

# Perform the network check and log the results
check_network

