# Logging and Verification

## Purpose

Show that hardening changes were not only applied, but also **checked, interpreted, and documented**.

This stage turns the lab from “I changed some settings” into “I verified the system state and reviewed evidence.”

---

## Verification mindset

Verification in this project answers three questions:

1. **Was the configuration change applied?**
2. **Did the system remain reachable and functional?**
3. **Is there evidence in status output or logs that supports the change?**

---

## Evidence categories

### 1) Configuration evidence
Used to confirm intended settings exist.

Examples:
```bash
grep -E '^(PermitRootLogin|PasswordAuthentication|PubkeyAuthentication)' /etc/ssh/sshd_config
sshd -t
ufw status verbose
aa-status
```

### 2) Service evidence
Used to confirm relevant services are active or enabled.

Examples:
```bash
systemctl status ssh --no-pager
systemctl status fail2ban --no-pager
systemctl status apparmor --no-pager
systemctl is-enabled ssh
```

### 3) Log evidence
Used to observe how the system reacts over time.

Examples:
```bash
journalctl -u ssh -n 50 --no-pager
journalctl -u fail2ban -n 50 --no-pager
journalctl -k | grep -i apparmor
grep -i "Failed password" /var/log/auth.log
grep -i "Accepted" /var/log/auth.log
```

---

## Logs worth reviewing

### SSH-related logs
These help confirm login attempts, access success, and failures.

Possible sources:
- `/var/log/auth.log`
- `journalctl -u ssh`
- `journalctl -u sshd` depending on the service name

Look for:
- failed password attempts
- accepted public key logins
- refused or denied behavior after config changes

### fail2ban-related logs
These help confirm bans, unbans, and jail state.

Possible sources:
- `journalctl -u fail2ban`
- `/var/log/fail2ban.log`

Look for:
- jail startup
- ban events
- unban events
- configuration load messages

### AppArmor-related logs
These help confirm whether confinement-related deny events appear.

Possible sources:
- `journalctl -k`
- the general system journal

Look for:
- `DENIED`
- profile names
- involved binaries or paths
- whether the event is expected or abnormal

---

## Verification script

This project includes:

```bash
bash scripts/verify-hardening.sh
```

The script is used to collect repeatable verification output such as:
- OS information
- key SSH settings
- service states
- UFW status
- fail2ban status
- AppArmor status
- recent log excerpts when available

Expected output file:
- `notes/verification-report.txt`

---

## What good verification looks like

A good verification pass should show:

- SSH configuration syntax is valid
- root login and password policy are documented and testable
- UFW is active with deliberate allowed services
- fail2ban is installed and responding as expected
- AppArmor status is visible
- logs contain interpretable evidence rather than unexplained noise
- the system remains administratively reachable

---

## Example review questions

Use these when writing the final report:

- Did the firewall allow only what the lab needed?
- Did fail2ban start correctly and reference the intended jail?
- Was SSH tested before the old session was closed?
- Did AppArmor report loaded profiles?
- Were any denies or warnings observed after the changes?
- Can each hardening step be linked to at least one verification artifact?

---

## Common mistakes to avoid

- changing SSH settings without testing config syntax first
- enabling UFW before confirming the required allow rules
- assuming fail2ban works without checking its status or journal
- disabling services without confirming their role
- treating logs as noise instead of evidence
- documenting only commands, but not what the results mean

---

## Final evidence set for the repo

At minimum, collect:

- `ssh-config-test.png`
- `ufw-status.png`
- `fail2ban-status.png`
- `apparmor-status.png`
- `verification-script.png`

And keep:
- `notes/baseline-report.txt`
- `notes/verification-report.txt`

These files make the repository easier to review quickly and more convincing as a systems-security project.
