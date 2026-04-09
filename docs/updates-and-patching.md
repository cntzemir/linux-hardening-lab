# Updates and Patching

## Purpose

This document records the update and patching part of the lab.

The goal is to make the hardening process start from a reasonably current baseline rather than from outdated package state.

## Review Areas

- package metadata refresh
- available updates
- security update behavior
- reboot implications
- whether patching changes the system state in a way that affects later hardening steps

## Why It Matters

A hardened system is weaker if it starts from avoidable outdated software state.

Patching does not replace configuration hardening, but it reduces known exposure and makes the rest of the hardening workflow more meaningful.

## Notes

This lab treats update hygiene as an early prerequisite, not as a final cosmetic step.
