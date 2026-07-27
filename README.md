# Offensive Security & Penetration Testing Labs

## Why I Built This
I wanted to understand attacker methodology directly, not just read about it in theory. Building 
more resilient, secure-by-design systems starts with knowing exactly how they get broken. This 
repository serves as a practical testing ground for exploiting misconfigurations at the network, 
OS, and application layers.

## What I Built / Executed
All labs were executed in strictly isolated VirtualBox environments to ensure zero accidental 
blast radius.

### 1. Web Application Vulnerability Research (AltoroMutual Clone)
- Reproduced an offline banking portal to demonstrate SQL Injection and Reflected XSS.
- Bypassed authentication via a boolean tautology (`' OR '1'='1'`) and executed arbitrary 
  JavaScript through DOM manipulation.
- **Remediation mapped:** Documented the exact fixes required: parameterized queries and HTML 
  entity encoding.

### 2. Network Reconnaissance & Firewall Mapping
- Used Nmap (SYN, TCP Connect, UDP, ACK scans) against a Metasploitable target to map open ports 
  and firewall rules by analyzing response behavior across protocols. The ACK scan specifically 
  confirmed the target had no active firewall, since every probed port returned "unfiltered."

### 3. Full Exploit Chain: Backdoor to Keylogger
- Exploited the well-known vsftpd 2.3.4 backdoor (CVE-2011, still present on Metasploitable) via 
  Metasploit to gain an initial command shell, then upgraded to a full Meterpreter session, 
  confirming root-level access.
- Deployed a Python-based keylogger through the root shell, using the Linux `script` utility to 
  capture and log an entire terminal session's keystrokes, then retrieved the log file remotely 
  to confirm capture of simulated credentials.

### 4. Denial of Service (DoS) Analysis
- Executed a TCP SYN Flood via `hping3` and measured system degradation using `top`.
- Baseline CPU idle sat at 83.5% pre-attack. During the flood, idle time dropped to 52.3%, and 
  software interrupts (`si`) spiked to 41.4%, direct evidence the kernel was dedicating nearly 
  half its processing power to handling the malicious packet flood rather than legitimate work.

### 5. Privilege Escalation & Trojan Delivery
- Engineered a destructive Bash payload (`rm -rf --no-preserve-root /`) disguised as a fake 
  "Critical System Update" via a `.desktop` shortcut, a social-engineering delivery mechanism 
  rather than a technical exploit.
- Configured a NOPASSWD entry in `/etc/sudoers.d/` intended to let the payload run without a 
  password prompt. In practice, Kali's PolicyKit graphical security layer still intercepted the 
  untrusted `.desktop` launcher and forced manual authentication, an instructive result showing 
  that command-line sudo bypass and GUI-level trust enforcement are separate security layers.
- Post-execution, the terminal returned a flood of `Operation not permitted` errors as core 
  system files were wiped, confirmed the target was rendered unrecoverable.

## Why I Made These Calls
- **Strict Containment:** I ran all exploits in local, air-gapped VirtualBox VMs rather than any 
  shared or cloud environment, to ensure every technique stayed strictly within an authorized, 
  isolated lab scope with zero risk to any live system.
- **Defensive Focus:** I deliberately prioritized documenting the *fixes* alongside the exploits. 
  Breaking systems is only valuable to an engineering team if it directly informs secure coding 
  and architecture standards.

## What I'd Do Next
I want to expand this repository to prove both the offense and the corresponding defense. Next 
steps:
1. **Network Detection:** Write the specific Snort/Suricata rules that would have caught the SYN 
   flood, Nmap scans, and the vsftpd backdoor exploitation on the wire.
2. **Cloud Mitigation Mapping:** Map these traditional infrastructure attacks to cloud-native 
   defenses, documenting how AWS WAF would block the AltoroMutual web exploits, and how AWS 
   Shield mitigates volumetric DoS attacks at the edge.
