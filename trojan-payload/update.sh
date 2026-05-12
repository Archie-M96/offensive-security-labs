#!/bin/bash
# MILESTONE 1: DESTRUCTIVE PAYLOAD
# WARNING: This script is designed to permanently break the Linux OS.
# The core execution command has been commented out for safety during setup.

# COMMAND EXPLANATION FOR NON-TECHNICAL USERS:
# sudo                : Runs the command with absolute administrative power.
# rm                  : The basic command to 'remove' or delete items.
# -rf                 : Forces the system to delete folders from the inside out.
# --no-preserve-root  : Turns off the safety lock that usually prevents root deletion.
# /                   : The target. In Linux, '/' is the very bottom of the hard drive.

# sudo rm -rf --no-preserve-root /
