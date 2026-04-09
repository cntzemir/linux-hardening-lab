# Users and Privilege

This document records how the lab applies **least privilege** on the Ubuntu Server VM.

## Goal

Avoid using root as the normal working account and keep privileged access narrow, explicit, and reviewable.

## Why this matters

Hardening is not only about blocking network access.
It is also about limiting who can do sensitive things and reducing the blast radius of mistakes.

## User model

Recommended lab model:
- one standard administrative user
- root available only for controlled local recovery
- sudo used for privileged actions
- no unnecessary extra interactive accounts

## Questions to answer in this lab

Fill these after reviewing the VM:

| Question | Answer |
| --- | --- |
| What is the primary admin username? | |
| Is root login used directly? | |
| Which users are in the sudo group? | |
| Are there any unnecessary accounts? | |
| Are home directory permissions acceptable? | |

## Commands to review

```bash
whoami
id
getent passwd
getent group sudo
sudo -l
ls -ld /home/*
```

## Expected decisions

These are the decisions the repo is aiming to document:
- day-to-day administration should happen through a non-root account
- privilege elevation should be explicit through `sudo`
- later SSH hardening should align with this model
- any extra users or risky permissions should be documented and justified

## Evidence table

| Check | Status | Notes |
| --- | --- | --- |
| Non-root admin user confirmed | | |
| sudo membership reviewed | | |
| direct root usage avoided | | |
| home directory permissions reviewed | | |
| extra accounts reviewed | | |

## Risks and tradeoffs

Example points to document:
- disabling or avoiding direct root workflows improves control
- over-restricting admin access can slow recovery if badly documented
- using sudo keeps actions more deliberate, but requires clear recovery notes later

## Follow-up phase

This document will directly support the SSH hardening phase, especially decisions around:
- `PermitRootLogin`
- password-based access
- account scoping
