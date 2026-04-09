# Recovery Notes

## Purpose

This document records practical recovery thinking for hardening-related mistakes or over-restrictive configuration.

The goal is to make security changes safer to review and apply by keeping rollback and troubleshooting paths visible.

## Recovery Scenarios

### 1. SSH Access Problems
If SSH configuration changes break remote access:
- validate configuration before restart whenever possible
- use console or direct VM access for recovery
- restore the previous SSH configuration if needed
- restart the SSH service only after configuration syntax is confirmed

### 2. Firewall Lockout
If UFW rules block intended access:
- use direct console access in the VM
- review active rules carefully
- remove or adjust the rule causing the lockout
- confirm the minimal required access before re-enabling stricter rules

### 3. fail2ban Access Friction
If a legitimate user is blocked during testing:
- inspect fail2ban status
- identify the relevant jail
- unban only after understanding the trigger
- confirm whether the ban reflects expected policy behavior

### 4. Service Reduction Side Effects
If disabling a service affects expected functionality:
- confirm the service purpose
- re-enable the service if it is needed for the lab
- document why the original removal caused operational impact

### 5. AppArmor-Related Troubleshooting
If AppArmor behavior causes confusion or denial:
- confirm profile status
- inspect relevant logs where available
- verify whether the observed behavior is expected enforcement or configuration friction

## General Rule

Every hardening change should be paired with a reasonable recovery path.

A defensive control is stronger when it is not only secure, but also understandable and recoverable.
