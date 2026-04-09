# Updates and Patching

This document records how the lab handles package updates and automatic security patching.

## Goal

The system should start from a current package state and keep receiving security updates in a controlled way.

## Why this matters

A hardened host with outdated packages is still exposed.
Security maintenance is part of hardening, not a separate task.

## Manual update workflow

Use this order:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean
```

After updates, verify:
- whether a reboot is required
- whether any service changed behavior
- whether package errors were reported

Helpful checks:

```bash
apt list --upgradable
[ -f /var/run/reboot-required ] && echo "reboot required"
```

## Automatic security updates

On Ubuntu Server, unattended security updates are commonly managed with `unattended-upgrades`.

Review:

```bash
dpkg -l | grep unattended-upgrades
cat /etc/apt/apt.conf.d/20auto-upgrades
cat /etc/apt/apt.conf.d/50unattended-upgrades
```

Record:
- whether `unattended-upgrades` is installed
- whether automatic updates are enabled
- whether only security updates are allowed or broader updates too
- whether automatic reboot behavior is enabled

## Lab decision

Recommended lab stance:
- enable automatic security updates
- keep the scope conservative
- review reboot behavior explicitly
- document the tradeoff between convenience and control

## Evidence to capture

| Evidence | Status | Notes |
| --- | --- | --- |
| `apt update` completed | | |
| `apt upgrade` completed | | |
| `apt list --upgradable` reviewed | | |
| `unattended-upgrades` installed | | |
| `20auto-upgrades` reviewed | | |
| reboot requirement checked | | |

## Screenshot checklist

Add later:
- terminal capture of update commands
- `20auto-upgrades` review if useful

## Notes and tradeoffs

Example points to discuss:
- automatic security updates reduce patch delay
- automatic restarts can interrupt lab services
- manual review provides more control but increases operational burden
