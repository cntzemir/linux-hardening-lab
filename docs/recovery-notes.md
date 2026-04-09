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

### 3. fail2ban False Positives
If fail2ban blocks valid testing or administrative activity:
- inspect the relevant jail status
- review recent failed authentication attempts
- unban carefully if required
- confirm whether the triggering behavior was expected test activity

### 4. AppArmor Friction
If AppArmor-related behavior causes confusion:
- verify whether the issue is actually AppArmor-related
- inspect service status and logs
- confirm whether the lab requires a change or only documentation of the constraint

## Practical Reminder

A hardening change is stronger when its rollback path is also understood.
