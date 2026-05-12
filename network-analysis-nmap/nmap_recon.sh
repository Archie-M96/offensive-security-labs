#!/bin/bash
# Nmap Reconnaissance Cheatsheet & Automation
# Target: Metasploitable Virtual Machine (192.168.1.10)

echo "Starting Stealth Scan (SYN)..."
sudo nmap -sS 192.168.1.10

echo "Starting TCP Connect Scan..."
sudo nmap -sT 192.168.1.10

echo "Starting UDP Scan (Fast mode)..."
sudo nmap -sU -F 192.168.1.10

echo "Starting ACK Scan (Firewall Mapping)..."
sudo nmap -sA 192.168.1.10
