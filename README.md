# Offensive Security & Penetration Testing Labs

This repository documents hands-on security research conducted in isolated VirtualBox environments. The focus is on understanding attacker methodologies to build more resilient, "Secure by Design" systems.

## 🛡️ Featured Research & Exploitation
### 1. Web Application Vulnerability Research (AltoroMutual Clone)
- **Objective:** Reproduced an offline banking portal to demonstrate **SQL Injection (SQLi)** and **Reflected XSS**.
- **Impact:** Successfully bypassed authentication via boolean tautology (`' OR '1'='1'`) and executed arbitrary JavaScript via DOM manipulation.
- **Defense focus:** Documented the necessity of parameterized queries and HTML entity encoding.

### 2. Network Reconnaissance & Firewall Mapping
- **Tooling:** Nmap (SYN, TCP, UDP, and ACK scans).
- **Key Insight:** Used ACK scanning to map out firewall rulesets by analyzing RST packet responses from the target kernel.

### 3. Denial of Service (DoS) Analysis
- **Attack Vector:** TCP SYN Flood utilizing `hping3`.
- **Metrics:** Analyzed system degradation via `top`, observing a 20.9% spike in software interrupts (si), indicating kernel-level resource exhaustion.

### 4. Privilege Escalation & Trojan Delivery
- **Mechanism:** Engineered a Bash-based destructive payload disguised as a system update utility.
- **Execution:** Successfully bypassed standard user restrictions via custom `/etc/sudoers.d/` configurations to achieve root-level file system deletion.
