# Firewall and fail2ban

## Purpose

This document covers host-level network exposure reduction and basic brute-force resistance.

The goal is to reduce unnecessary inbound exposure and add a practical response layer for repeated authentication abuse.

## Firewall Goals

The firewall review in this lab focuses on:
- identifying exposed services
- allowing only required access
- preferring explicit inbound rules
- reviewing status after rule changes

UFW is used as the main host firewall interface for simplicity and clarity.

## fail2ban Goals

fail2ban is included to provide a practical defensive response to repeated failed authentication patterns.

In this lab, its purpose is to:
- monitor repeated access failures
- reduce brute-force noise
- support SSH protection in a simple, reviewable way

## Verification Areas

Verification should include:
- firewall status review
- allowed-rule review
- fail2ban service status
- jail visibility
- consistency between intended exposure and active rules

## Tradeoff Reminder

Restrictive network policy is useful only if it remains understandable and recoverable.

Firewall and fail2ban changes should always be documented together with:
- what was intended
- what could go wrong
- how to recover from accidental lockout
