#!/bin/bash

# Linux Hardening Script
# Author: Vladyslav Plakhov
# GitHub: https://github.com/skwidstone/linux-hardener

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# Update and install necessary packages
echo "Updating system and installing required packages..."
apt update && apt install -y ufw fail2ban

# Configure UFW (Uncomplicated Firewall)
echo "Configuring UFW..."
if ! command -v ufw &> /dev/null; then
    echo "UFW not found, installing..."
    apt install -y ufw
fi

ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp  # Allow SSH (modify if using a different port)
ufw --force enable

echo "UFW has been configured and enabled."

# Secure SSH Configuration
SSHD_CONFIG="/etc/ssh/sshd_config"
echo "Securing SSH..."
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' $SSHD_CONFIG
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' $SSHD_CONFIG
echo "SSH configuration updated. Restarting SSH service..."
systemctl restart sshd

# Configure Fail2Ban
echo "Configuring Fail2Ban..."
cat <<EOF > /etc/fail2ban/jail.local
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 5

debian-iptables
enabled = true
EOF

systemctl enable fail2ban --now
echo "Fail2Ban configured and started."

# Disable root login
echo "Disabling root login..."
passwd -l root

echo "Security hardening complete! Reboot recommended."
