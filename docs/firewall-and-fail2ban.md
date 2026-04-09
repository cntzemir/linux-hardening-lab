# Firewall and Fail2ban

## Purpose

Reduce exposed network surface and add a basic defensive response to repeated SSH abuse attempts.

## Goal of this phase

This phase covers:
- setting a default firewall posture
- allowing only required services
- checking the resulting rule set
- adding fail2ban for repeated SSH login abuse

## Firewall strategy

For a small Ubuntu Server lab, the safest baseline is:

- deny incoming by default
- allow outgoing by default
- explicitly allow only the ports that are needed

## UFW workflow

### 1) Check current status
```bash
sudo ufw status verbose
```

### 2) Set default policies
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### 3) Allow SSH
Use the real SSH port if it was changed.

Default example:
```bash
sudo ufw allow 22/tcp comment 'OpenSSH'
```

### 4) Enable UFW
```bash
sudo ufw enable
```

### 5) Verify resulting rules
```bash
sudo ufw status verbose
```

## Optional lab extensions

If this VM later hosts a web service, you may document additional explicit allows such as:
```bash
sudo ufw allow 80/tcp comment 'HTTP'
sudo ufw allow 443/tcp comment 'HTTPS'
```

Do not open services that are not actually needed for the lab.

## What to record

Document:
- default inbound policy
- allowed ports
- whether the SSH port changed
- the final `ufw status verbose` output
- why only those ports were allowed

## Fail2ban workflow

### 1) Install fail2ban
```bash
sudo apt update
sudo apt install -y fail2ban
```

### 2) Check service status
```bash
sudo systemctl status fail2ban --no-pager
```

### 3) Confirm SSH jail visibility
```bash
sudo fail2ban-client status
sudo fail2ban-client status sshd
```

If the distro uses a different jail name, document that clearly.

### 4) Optional local configuration
A minimal local override typically belongs in:
```text
/etc/fail2ban/jail.local
```

Example lab-oriented idea:
```ini
[sshd]
enabled = true
maxretry = 5
findtime = 10m
bantime = 15m
```

Only apply changes you understand and can verify.

### 5) Restart and verify after changes
```bash
sudo systemctl restart fail2ban
sudo fail2ban-client status sshd
```

## Evidence to capture

Take screenshots of:
- `sudo ufw status verbose`
- `sudo systemctl status fail2ban --no-pager`
- `sudo fail2ban-client status sshd`

Suggested filenames:
- `screenshots/ufw-status.png`
- `screenshots/fail2ban-status.png`

## Expected security value

### UFW
- reduces exposed inbound attack surface
- makes network exposure explicit
- keeps the lab easier to reason about

### fail2ban
- helps slow repeated SSH guessing attempts
- adds a basic defensive reaction layer
- gives useful status output for documentation

## Tradeoff notes

- overly strict firewall rules can block legitimate administration
- fail2ban can lock out the admin during testing if used carelessly
- changing the SSH port is not a primary defense by itself; document it only if you actually use it

## Recovery note summary

If UFW blocks access:
- use the VM console
- inspect rules
- delete the bad rule or temporarily disable UFW

If fail2ban blocks you:
- use console access
- inspect the jail status
- unban the address if required

Detailed recovery steps will be completed in `docs/recovery-notes.md`.
