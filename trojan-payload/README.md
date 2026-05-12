# Privilege Escalation & Trojan Delivery

## Objective
This lab demonstrates a "Trojan horse" attack designed to completely compromise a Linux operating system by deleting its foundational root directory. It showcases how social engineering can be combined with privilege escalation to bypass security controls.

## Attack Vector & Mechanics
### 1. Privilege Escalation (Sudoers Bypass)
To ensure the payload executed silently without prompting for a password, a silent root bypass was configured in the `/etc/sudoers.d/` directory:
`echo "kali ALL (ALL) NOPASSWD: /home/kali/update.sh" | sudo tee /etc/sudoers.d/silent_update`

### 2. The Destructive Payload (update.sh)
A malicious bash script was engineered to execute `sudo rm -rf --no-preserve-root /`. This recursively forces the deletion of the entire file system from the root directory down, overriding standard failsafes.

### 3. Social Engineering Wrapper (System_Update.desktop)
The payload was disguised as an official system utility using a `.desktop` shortcut placed on the user's desktop. It utilized a standard system update icon to trick the user into willingly executing the malicious script.

## Execution Analysis: "Ghost in the RAM"
Upon execution, the system did not immediately black out. Due to memory management, the desktop background and UI elements temporarily remained visible because they were loaded in the temporary memory (RAM). Meanwhile, the physical files on the hard drive were actively being wiped, resulting in cascading `Operation not permitted` and `No such file or directory` terminal errors until the machine became permanently unrecoverable.
