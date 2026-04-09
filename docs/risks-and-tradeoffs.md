# Risks and Tradeoffs

## Purpose

This document records the operational tradeoffs introduced by tighter hardening decisions.

The goal is to avoid presenting security controls as if they were free of usability, access, or recovery costs.

## Main Tradeoff Areas

### 1. Access Risk
Tightening SSH access can reduce exposure, but it can also increase the chance of accidental lockout if changes are applied without validation.

### 2. Firewall Misconfiguration
Restrictive firewall policy reduces network surface, but incorrect rules can block intended access or break administrative workflow.

### 3. Administrative Overhead
Additional protection layers improve security posture, but they also increase the number of controls that must be monitored and understood.

### 4. Debugging Friction
When multiple defensive layers are active, troubleshooting becomes more complex. A problem may come from SSH policy, firewall rules, fail2ban behavior, or service-level configuration.

### 5. Lab vs Production Gap
A learning-focused hardening lab is useful for reasoning and documentation, but it should not be mistaken for a complete production hardening standard.

## Project Position

This repository intentionally includes tradeoff discussion because secure configuration should be explainable, reversible, and operationally reasonable.
