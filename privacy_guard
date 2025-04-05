#!/bin/bash

agent="SecurityBot"
mac_address="74:da:38:8b:a5:c2"
ping_server="208.67.220.220"
dns_default="192.168.0.1"

# Function to display notifications
send_message() {
    sudo -u under0 DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "$agent" "$1" || echo "Failed to send notification: $1"
}

# Check if the specified MAC address is visible, indicating potential security issue
if sudo ifconfig | grep -q "$mac_address"; then
    send_message "MAC is not secured"
fi

# Check the internet connection by pinging OpenDNS server; notify if the connection is down
if ! sudo ping -c 4 "$ping_server" &>/dev/null; then
    send_message "Internet connection lost"
fi

# Check if the default DNS server is active, which could indicate DNS security issues
if sudo resolvectl status | grep -q "$dns_default"; then
    send_message "DNS is not secured"
fi

# Check if the VPN service is active, alert if not connected
if ! systemctl is-active --quiet vpn.service; then
    send_message "VPN is not established"
fi
