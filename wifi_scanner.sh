#!/bin/bash

# Simple WiFi Scanner Tool using nmcli

echo "========================================="
echo "         WiFi Scanner Tool"
echo "========================================="

# Checking if nmcli is available
if ! command -v nmcli &> /dev/null; then
    echo "Error: nmcli command not found. Please install NetworkManager."
    exit 1
fi

echo ""
echo "Scanning for available WiFi networks..."
echo ""

# Run nmcli to list wifi
nmcli -f SSID,SIGNAL,BARS,SECURITY dev wifi list | awk 'NR==1 || !seen[$0]++'

echo ""
echo "Scan complete."

