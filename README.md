# Offensive Security & Penetration Testing Labs

## Why I Built This
I wanted to understand attacker methodology directly, not just read about it. Building more 
resilient, secure-by-design systems starts with knowing exactly how they get broken. All labs 
run in isolated VirtualBox environments.

## What I Did

### 1. Web Application Vulnerability Research (AltoroMutual Clone)
- Reproduced an offline banking portal to demonstrate SQL Injection and Reflected XSS.
- Bypassed authentication via a boolean tautology (`' OR '1'='1'`) and executed arbitrary 
  JavaScript through DOM manipulation.
- Documented the fix: parameterized queries and HTML entity encoding.

### 2. Network Reconnaissance & Firewall Mapping
- Used Nmap (SYN, TCP, UDP, ACK scans) to map firewall rulesets by analyzing RST packet responses 
  from the target kernel.

### 3. Denial of Service (DoS) Analysis
- Ran a TCP SYN Flood via `hping3` and measured system degradation with `top`, observing a 20.9% 
  spike in software interrupts (si), a clear sign of kernel-level resource exhaustion.

### 4. Privilege Escalation & Trojan Delivery
- Engineered a Bash-based destructive payload disguised as a system update utility, bypassing 
  standard user restrictions via a custom `/etc/sudoers.d/` entry to reach root-level file deletion.

## What I'd Do Next
I'd like to add detection-side coverage next: writing the Snort/Suricata rules that would have 
caught each of these attacks, so this repo proves both the offense and the corresponding defense.
