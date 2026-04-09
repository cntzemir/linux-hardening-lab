# SSH Hardening

## Purpose

This document explains the SSH hardening direction used in the lab.

The focus is on reducing unnecessary remote-access risk while keeping the system administratively usable inside a controlled lab environment.

## Main Review Areas

- root login policy
- password authentication policy
- SSH configuration validation
- controlled restart workflow
- access verification after changes
- lockout awareness and recovery planning

## Security Rationale

SSH is one of the most important remote entry points on a Linux server.

For that reason, the hardening approach focuses on:
- limiting direct privileged access
- avoiding permissive authentication choices where possible
- validating configuration before restart
- checking recovery paths before making access stricter

## Practical Mindset

This lab does not treat SSH hardening as a blind checklist.

Each change should be evaluated with two questions:
1. Does it reduce remote access risk?
2. Can the system still be recovered safely if the change is misapplied?

## Related Files

- `scripts/verify-hardening.sh`
- `docs/recovery-notes.md`
- `notes/command-reference.md`
