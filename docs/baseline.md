# Baseline Before Hardening

This document captures the **starting state** of the Ubuntu Server VM before major hardening changes are applied.
The goal is to make later changes explainable, testable, and reversible.

## Why this matters

A hardening lab is stronger when it can show:
- what the system looked like before changes
- what changed
- why the change was made
- how the change was verified

## Important execution note

The baseline script must be run from the **Ubuntu VM itself**.

Use:
```bash
bash scripts/collect-baseline.sh
```

Do **not** run it from Windows PowerShell on the host machine.  
That would either fail or collect information from the wrong environment.

## What to do next

1. Open the Ubuntu VM terminal.
2. Go to the project folder.
3. Run:
   ```bash
   bash scripts/collect-baseline.sh
   ```
4. Open:
   ```bash
   cat notes/baseline-report.txt
   ```
5. Use that output to complete the sections below.
6. Take screenshots for:
   - system identity
   - listening sockets
   - enabled services
   - sudo group
   - upgradable packages

## Target system snapshot

Fill this after running the baseline script.

| Field | Value |
| --- | --- |
| Hostname | |
| OS release | |
| Kernel | |
| Architecture | |
| Primary IP | |
| Active user | |
| Uptime | |

## Accounts and access

Record the accounts that exist before hardening.

| Item | Notes |
| --- | --- |
| Current non-root user | |
| Root SSH access status | |
| Password authentication status | |
| sudo group members | |

## Network exposure

Record what is listening before firewall and SSH tightening.

| Item | Notes |
| --- | --- |
| Listening services | |
| Open ports | |
| Remote access path | |

## Services

Summarize notable enabled or running services.

| Service | State | Notes |
| --- | --- | --- |
| ssh | | |
| systemd-timesyncd | | |
| unattended-upgrades | | |
| other notable services | | |

## Package state

| Item | Notes |
| --- | --- |
| Upgradable packages present | |
| Reboot required | |
| Update policy before hardening | |

## Baseline evidence

Add:
- command output excerpts from `notes/baseline-report.txt`
- screenshots from the Ubuntu VM
- short notes explaining anything unexpected
