# Command Reference

This file collects useful commands referenced during the lab. Review commands before running them and adapt them to the actual VM state.

## Baseline Collection
```bash
uname -a
lsb_release -a
hostnamectl
ss -tulpn
systemctl list-units --type=service --state=running
systemctl list-unit-files --type=service
```

## Updates and Patching
```bash
sudo apt update
sudo apt upgrade -y
sudo apt list --upgradable
sudo reboot
```

## Users and Privilege
```bash
whoami
id
getent passwd
getent group
sudo -l
```

## SSH Hardening
```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo nano /etc/ssh/sshd_config
sudo sshd -t
sudo systemctl restart ssh
sudo systemctl status ssh
```

## Firewall
```bash
sudo ufw status verbose
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw delete allow OpenSSH
```

## fail2ban
```bash
sudo systemctl status fail2ban
sudo fail2ban-client status
sudo fail2ban-client status sshd
sudo fail2ban-client set sshd unbanip 127.0.0.1
```

## AppArmor
```bash
sudo aa-status
sudo systemctl status apparmor
journalctl -xe | grep -i apparmor
```

## Verification
```bash
bash scripts/collect-baseline.sh
bash scripts/verify-hardening.sh
cat notes/baseline-report.txt
cat notes/verification-report.txt
```
