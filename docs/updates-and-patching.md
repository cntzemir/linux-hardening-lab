# Updates and Patching

## Purpose

This document explains the update and patching hygiene used in the lab.

Keeping the system current is one of the simplest and most effective ways to reduce exposure to known vulnerabilities.

## Main Review Areas

- package index refresh
- package upgrade status
- security update behavior
- reboot awareness after major updates
- consideration of unattended updates

## Security Rationale

A hardened system that is significantly out of date can still remain exposed.

For that reason, update hygiene is treated as an early hardening step rather than an afterthought.

## Practical Workflow

The lab update workflow should include:
1. refreshing package information
2. reviewing upgrade availability
3. applying appropriate upgrades
4. checking whether a reboot is required
5. documenting the resulting update state

## Notes

Automatic updates can improve security posture, but they should still be understood and monitored rather than enabled blindly.
