# Command Reference

This file collects example commands used during the lab for quick review.

## Baseline
```bash
bash scripts/collect-baseline.sh
ss -tulpn
systemctl list-units --type=service --state=running
uname -r
```

## Updates
```bash
sudo apt update
sudo apt upgrade
sudo unattended-upgrades --dry-run --debug
```

## SSH
```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudoedit /etc/ssh/sshd_config
sudo sshd -t
sudo systemctl restart ssh
sudo systemctl status ssh
```

## UFW
```bash
sudo ufw status verbose
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw delete allow 80/tcp
```

## fail2ban
```bash
sudo systemctl status fail2ban
sudo fail2ban-client status
sudo fail2ban-client status sshd
```

## AppArmor
```bash
sudo aa-status
systemctl status apparmor
```

## Verification
```bash
bash scripts/verify-hardening.sh
cat notes/verification-report.txt
```
