# Linux Hardener

## Overview
Linux Hardener is a Bash script designed to automate essential security configurations on a Debian-based system. It enhances system security by configuring UFW, securing SSH, enabling Fail2Ban, and disabling root login.

## Features
- Updates the system and installs security-related packages.
- Configures UFW (Uncomplicated Firewall) to allow only SSH access.
- Secures SSH by disabling root login and enforcing stronger authentication settings.
- Installs and configures Fail2Ban to prevent brute-force attacks.
- Disables root login for added security.

## Requirements
- Debian-based distribution (Debian, Ubuntu, etc.)
- Bash shell
- Sudo privileges

## Installation
Clone the repository and navigate to the directory:
```bash
 git clone https://github.com/skwidstone/linux-hardener.git
 cd linux-hardener
```

## Usage
Run the script with root privileges:
```bash
sudo ./linux-hardener.sh
```

## Notes
- The script modifies SSH and firewall settings. Ensure you have console access in case of misconfiguration.
- A system reboot is recommended after execution.

## License
This project is licensed under the MIT License.

