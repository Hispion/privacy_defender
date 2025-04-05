#!/bin/bash

# New MAC address to assign
mac_new="d0:57:7b:11:39:c2"
# Network interface to change MAC address
net_interface="wlp2s0f3u2"

# Check if macchanger is installed
if ! command -v macchanger &>/dev/null; then
    echo "macchanger is not installed. Please install it to proceed."
    exit 1
fi

# Check if the network interface exists
if ! ip link show "$net_interface" &>/dev/null; then
    echo "Network interface $net_interface not found."
    exit 1
fi

# Change the MAC address
echo "Changing MAC address on $net_interface to $mac_new..."
sudo macchanger --mac="$mac_new" "$net_interface"

# Confirm the change
echo "MAC address for $net_interface has been changed."
