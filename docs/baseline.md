# Baseline

## Purpose

This document records the initial system state before hardening-related changes are applied.

The goal is to preserve a clear reference point for comparison so that the lab reflects intentional change rather than undocumented configuration drift.

## What Was Reviewed

The baseline review focuses on:
- operating system and release information
- hostname and host context
- kernel information
- network identity and address context
- currently running services
- enabled services
- exposed listening ports
- update state
- basic firewall state

## Why Baseline Matters

A hardening workflow is more useful when the starting point is documented.

Without a baseline:
- it becomes harder to explain what changed
- verification loses context
- tradeoffs are less visible
- rollback and recovery decisions become weaker

## Notes

Baseline collection in this repository is supported by the `scripts/collect-baseline.sh` script.

The exact system output can differ depending on:
- VM platform
- network mode
- Ubuntu image defaults
- installed packages
- whether OpenSSH Server is preinstalled
