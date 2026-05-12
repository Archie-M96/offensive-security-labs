# Penetration Testing: Metasploit & Keylogger Deployment

## Objective
The objective of this lab was to configure an isolated VirtualBox network, exploit a known vulnerable service to gain root access, and deploy a keystroke capture mechanism to simulate data exfiltration.

## Environment Setup
* **Hypervisor:** Oracle VirtualBox (Isolated Internal Network)
* **Attacker Machine:** Kali Linux (IP: 192.168.56.10)
* **Victim Machine:** Metasploitable 2 (IP: 192.168.56.20)

## Attack Vector & Execution
1. **Network Recon & Connectivity:** Established a 0% packet loss connection between the attacker and victim on the `intnet` network.
2. **Exploitation (CVE-2011-2523):** Utilized the Metasploit Framework (`msfconsole`) to target the `vsftpd 2.3.4` backdoor vulnerability on port 21. 
3. **Payload Delivery:** Executed the exploit to spawn a command shell with `root` privileges.
4. **Post-Exploitation (Meterpreter):** Upgraded the basic command shell to a Meterpreter session (`sessions -u 1`) to enable advanced post-exploitation capabilities.
5. **Keylogger Deployment:** Injected a Python-based keylogger script into the `/tmp` directory. 

## Impact & Results
Using the built-in Linux `script` utility, the keylogger successfully recorded the live terminal session. The attack successfully captured simulated victim activity, including system commands (`whoami`, `cat /etc/passwd`) and simulated credentials (`victim typed: admin123`).

This lab highlights the critical danger of unpatched software and the ease with which administrative credentials can be compromised post-exploitation.
