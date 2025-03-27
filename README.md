# Linux Hardener 🛡️  

**Linux Hardener** is a Bash script designed to automate the security hardening process for Linux servers. It applies essential security configurations to enhance system protection.  

## 🔹 Features  
✅ Disables root SSH login  
✅ Changes SSH port  
✅ Configures UFW/Iptables firewall  
✅ Restricts sudo access  
✅ Installs and configures fail2ban  
✅ Updates system packages  

## 🔹 Installation  
```bash
git clone https://github.com/skwidstone/linux-hardener.git  
cd linux-hardener  
chmod +x hardener.sh  
./hardener.sh  
