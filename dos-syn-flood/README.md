# Denial of Service (DoS): TCP SYN Flood

## Objective
[cite_start]This lab demonstrates the execution and analysis of a TCP SYN Flood attack [cite: 97] [cite_start]within an isolated VirtualBox Internal Network[cite: 104, 105]. [cite_start]The objective was to intentionally exhaust a target server's resources by exploiting the TCP Three-Way Handshake[cite: 97, 98].

## Attack Vector & Tooling
* [cite_start]**Tool:** `hping3` (Packet assembler and analyzer) [cite: 116]
* [cite_start]**Command Executed:** `sudo hping3 -S --flood -V -p 80 192.168.1.10` [cite: 117]
* [cite_start]**Mechanics:** The attacker machine rapidly sends connection requests (`-S` / SYN flag) as fast as physically possible (`--flood`) to port 80[cite: 119]. [cite_start]Because the attacker never sends the final ACK, the target server is forced to allocate memory to thousands of half-open connections[cite: 100, 101]. 

## Impact & Metric Analysis
[cite_start]To prove the attack's effectiveness, the built-in Linux `top` command was used to monitor the target's core processing strain[cite: 110, 111].

* [cite_start]**Baseline (Pre-Attack):** The system's CPU Idle time (`id`) sat at a healthy 83.8%[cite: 112]. [cite_start]Software interrupts (`si`) were at 0.0%[cite: 124].
* [cite_start]**During Attack:** CPU Idle dropped to 69.8%, indicating the system was struggling under the load[cite: 124]. 
* [cite_start]**The "Smoking Gun":** Software interrupts (`si`) spiked to 20.9%[cite: 124]. [cite_start]This proved that the target's OS kernel was dedicating nearly a quarter of its total processing power solely to managing the malicious packet flood[cite: 124].
* [cite_start]**Final Transmission:** The attacker successfully transmitted 502,808 packets with a 100% packet loss rate (expected, as the `--flood` flag intentionally ignores replies to maintain maximum outbound speed)[cite: 128, 129, 130].
