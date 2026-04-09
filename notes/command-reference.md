# Command Reference

This file collects commands used or likely to be used in the lab.

## Baseline
```bash
uname -r
hostnamectl
ip a
ss -tulpn
free -h
df -h
systemctl list-unit-files --type=service --state=enabled
apt list --upgradable
```

## Updates and patching
```bash
sudo apt update
sudo apt upgrade
apt-cache policy unattended-upgrades
systemctl status unattended-upgrades --no-pager
```

## Users and privilege
```bash
whoami
id
getent passwd
groups
sudo -l
```

## SSH hardening
```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
grep -E '^(PermitRootLogin|PasswordAuthentication|PubkeyAuthentication|AllowUsers)' /etc/ssh/sshd_config
sudo sshd -t
sudo systemctl restart ssh
sudo systemctl status ssh --no-pager
```

## Firewall
```bash
sudo ufw status verbose
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status numbered
```

## fail2ban
```bash
sudo apt install fail2ban
sudo systemctl enable --now fail2ban
sudo systemctl status fail2ban --no-pager
sudo fail2ban-client status
sudo fail2ban-client status sshd
sudo fail2ban-client set sshd unbanip <IP_ADDRESS>
journalctl -u fail2ban -n 50 --no-pager
```

## AppArmor
```bash
aa-status
systemctl status apparmor --no-pager
journalctl -k | grep -i apparmor
journalctl --since "today" | grep -i DENIED
```

## Services
```bash
systemctl list-units --type=service --state=running
systemctl list-unit-files --type=service --state=enabled
systemctl status <service-name> --no-pager
sudo systemctl disable --now <service-name>
sudo systemctl enable --now <service-name>
```

## Logging and verification
```bash
journalctl -u ssh -n 50 --no-pager
journalctl -u fail2ban -n 50 --no-pager
grep -i "Failed password" /var/log/auth.log
grep -i "Accepted" /var/log/auth.log
bash scripts/verify-hardening.sh
cat notes/verification-report.txt
```
