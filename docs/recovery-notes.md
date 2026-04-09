# Recovery Notes

## Purpose

Document how to recover from common mistakes during defensive hardening.

These notes are intentionally practical.  
They exist because lockouts and service interruptions are one of the main risks of system hardening work.

---

## General safety rules

Before making changes:

1. keep a backup of important configs
2. keep an existing admin session open
3. test changes incrementally
4. prefer console or VM access availability before risky changes
5. record what changed and when

Examples:
```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo ufw status numbered
```

---

## SSH recovery

### Problem
SSH access stops working after a hardening change.

### Safe approach
- use VM console access if available
- restore the last known good config
- validate syntax before restarting the service

### Example
```bash
sudo cp /etc/ssh/sshd_config.bak /etc/ssh/sshd_config
sudo sshd -t
sudo systemctl restart ssh
sudo systemctl status ssh --no-pager
```

### Notes
- do not close the original working session until a new session is confirmed
- if password authentication was disabled, confirm key-based access first

---

## UFW recovery

### Problem
Firewall rules block expected access.

### Review current rules
```bash
sudo ufw status numbered
```

### Remove a specific rule
```bash
sudo ufw delete <rule-number>
```

### Temporary emergency step
```bash
sudo ufw disable
```

### Notes
Use full disable only as a temporary recovery measure.  
After restoring access, re-apply a smaller, better-tested ruleset.

---

## fail2ban recovery

### Problem
A legitimate IP was banned during testing.

### Check jail status
```bash
sudo fail2ban-client status sshd
```

### Unban an address
```bash
sudo fail2ban-client set sshd unbanip <IP_ADDRESS>
```

### Service review
```bash
sudo systemctl status fail2ban --no-pager
journalctl -u fail2ban -n 50 --no-pager
```

### Notes
If repeated legitimate lockouts happen, review the jail parameters carefully instead of disabling the tool permanently.

---

## AppArmor recovery

### Problem
A service appears affected by AppArmor policy or a deny event is visible.

### First step
Inspect logs instead of disabling protection immediately:
```bash
journalctl -k | grep -i apparmor
journalctl --since "today" | grep -i DENIED
```

### Safer handling
- identify the service/profile involved
- confirm whether the event is real breakage or only noise
- adjust troubleshooting depth based on the importance of the service

### Last-resort note
If `apparmor-utils` is installed, specific profile troubleshooting may include complain-mode workflows.  
That should be used carefully and documented, not treated as a default permanent solution.

---

## Service disable recovery

### Problem
Disabling a service caused unexpected impact.

### Review service state
```bash
systemctl status <service-name> --no-pager
systemctl is-enabled <service-name>
```

### Re-enable if required
```bash
sudo systemctl enable --now <service-name>
```

### Notes
Document what dependency or workflow required the service so that the final repo reflects the real lesson.

---

## Update-related recovery

### Problem
A reboot or package change affected expected behavior.

### Review
```bash
journalctl -b -n 100 --no-pager
uname -r
systemctl --failed
```

### Notes
Keep update timing documented and note whether any post-update check was required.

---

## Final principle

Recovery notes are part of the project’s quality because they show:

- operational awareness
- respect for change risk
- ability to reverse mistakes safely
- defensive thinking beyond a one-time checklist
