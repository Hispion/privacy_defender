#!/bin/bash

# Default and OpenDNS server IPs
dns_default="192.168.0.1"
dns_opendns="208.67.222.222 208.67.220.220"
# Network interface to modify DNS settings for
net_interface="wlp2s0f3u2"

# Check if the current DNS is the default one
if sudo resolvectl status | grep -q "$dns_default"; then
    # Change DNS to OpenDNS if the default DNS is detected
    sudo resolvectl dns "$net_interface" $dns_opendns
    echo "DNS changed to OpenDNS."
else
    echo "Default DNS not found, no changes made."
fi
