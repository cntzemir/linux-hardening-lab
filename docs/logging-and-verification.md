# Logging and Verification

## Purpose

This document explains how hardening-related results are reviewed and verified in the lab.

The project does not stop at configuration changes. It also aims to confirm whether the expected protections are visible and whether the resulting system state matches the intended security direction.

## Verification Areas

The verification process in this lab focuses on:
- SSH configuration validity
- firewall status
- fail2ban availability and status
- AppArmor visibility
- service exposure review
- script-based re-checks

## Why Verification Matters

Hardening without verification can create a false sense of security.

A setting may look correct in a configuration file while:
- the service was not restarted
- the rule was not applied
- another control overrides it
- access broke in an unexpected way

Verification turns configuration into evidence.

## Logging Mindset

This lab is not a SIEM project, but logs still matter.

Basic log review helps answer:
- did a service accept the new configuration?
- are protection tools active?
- is an access-control layer reacting as expected?
- are there signs of denial or misconfiguration?

## Supporting Files

- `scripts/verify-hardening.sh`
- `notes/command-reference.md`
- `docs/recovery-notes.md`
