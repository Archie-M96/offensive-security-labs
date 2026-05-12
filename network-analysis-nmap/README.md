# Network Reconnaissance & Firewall Mapping

## Objective
[cite_start]The goal of this lab was to perform network reconnaissance against a Metasploitable virtual machine in an isolated internal network[cite: 140, 141]. I utilized different Nmap scan types to understand how communication protocols interact with target ports and how to map out firewall rulesets.

## Scan Methodologies & Commands

### 1. The Stealth Scan (SYN Scan)
* [cite_start]**Command:** `sudo nmap -sS 192.168.1.10` [cite: 188]
* **Mechanics:** Sends a SYN packet and waits for a SYN/ACK. [cite_start]Instead of completing the TCP three-way handshake, it immediately sends an RST (Reset) packet[cite: 146, 147, 148].
* [cite_start]**Impact:** Discovers open ports while often bypassing basic application-level logging, maintaining a "stealthy" footprint[cite: 153].

### 2. The TCP Connect Scan
* [cite_start]**Command:** `sudo nmap -sT 192.168.1.10` [cite: 188]
* [cite_start]**Mechanics:** Completes the full three-way TCP handshake (SYN -> SYN/ACK -> ACK)[cite: 157].
* [cite_start]**Impact:** Identifies the exact same open ports as the Stealth scan, but leaves a highly visible footprint in the target's security logs because a full connection was established[cite: 161, 162, 190].

### 3. The UDP Scan
* [cite_start]**Command:** `sudo nmap -sU -F 192.168.1.10` [cite: 188]
* **Mechanics:** Tests the connectionless User Datagram Protocol. [cite_start]If an ICMP "port unreachable" error is returned, the port is closed[cite: 164, 165].
* **Impact:** Identifies connectionless services. [cite_start]Output frequently labels ports as `open|filtered` due to the lack of guaranteed responses in the UDP protocol[cite: 170, 171].

### 4. Firewall Mapping (ACK Scan)
* [cite_start]**Command:** `sudo nmap -sA 192.168.1.10` [cite: 188]
* [cite_start]**Mechanics:** Sends an ACK packet to falsely imply an established connection[cite: 177]. 
* [cite_start]**Impact:** This scan does not look for open ports; it specifically maps firewall rules[cite: 181, 194, 195]. [cite_start]If the target responds with an RST packet, the port is marked `unfiltered` (confirming no firewall blocked it)[cite: 183]. [cite_start]In this lab, the target returned "unfiltered," confirming it lacked an active firewall[cite: 184].

