#!/bin/bash

# Clear the terminal screen
clear

# Define color codes for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Display the header with a border
echo -e "${BLUE}┌─────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│         Password Generator Tool           │${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────┘${NC}"
echo ""

# Prompt the user for the desired password length
read -p "Enter desired password length: " PASS_LENGTH

# Validate input to ensure it's a number
if ! [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Error: Please enter a valid number.${NC}"
    exit 1
fi

# Generate a random password using OpenSSL and trim it to the specified length
password=$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)

# Display the generated password inside a styled border
echo ""
echo -e "${GREEN}┌─────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│         Your Generated Password:          │${NC}"
printf "${GREEN}│  %-39s │\n" "$password"
echo -e "${GREEN}└─────────────────────────────────────────────┘${NC}"
echo ""

