# Adversary Methodology & Vulnerability Research

## Overview
This documentation serves as a theoretical deep-dive into the mechanics of advanced cyber threats, memory corruption vulnerabilities, and network reconnaissance techniques. 

### 1. Exploit Case Study: EternalBlue (CVE-2017-0144)
An analysis of the NSA-developed exploit that powered the 2017 WannaCry ransomware campaign.
* **Mechanism:** Exploits a heap buffer overflow in the Windows SMBv1 driver (`srv.sys`) via a malformed `Transaction2` request.
* **Payload:** Utilized the `DoublePulsar` kernel-mode implant for arbitrary DLL injection.
* **Impact:** Granted unauthenticated remote code execution (RCE) at the `SYSTEM` level, resulting in over 200,000 global infections.

### 2. Memory Corruption: Buffer Overflows
Research into how unsafe memory handling (e.g., C/C++ functions like `strcpy`) allows execution of arbitrary shellcode.
* **Stack-Based:** Overwriting the return address on the call stack to redirect execution flow.
* **Heap-Based:** Corrupting dynamic heap metadata to manipulate adjacent objects.
* **Modern Mitigations:** Understanding the role of ASLR (Address Space Layout Randomization), DEP/NX, and Stack Canaries in preventing code execution.

### 3. Privilege Escalation Strategies
A comparative analysis of post-exploitation lateral and vertical movement.
* **Vertical Escalation (Elevation):** Moving from a standard user to Administrator/Root (e.g., SUID/SGID binary abuse via GTFOBins, Kernel exploits like Dirty COW).
* **Horizontal Escalation:** Gaining access to resources belonging to an equivalently privileged user (e.g., Insecure Direct Object References (IDOR), Session Hijacking).

### 4. Advanced DNS Reconnaissance: Zone Walking
Exploration of how attackers exploit DNS Security Extensions (DNSSEC) to map internal infrastructure.
* **Technique:** Leveraging `NSEC` and `NSEC3` records to systematically enumerate all resource records within a DNS zone without requiring explicit zone transfer permissions.
