# AppArmor and Service Reduction

## Purpose

This document explains two related review areas in the lab:
- host-level application confinement visibility
- reduction of unnecessary running or enabled services

## AppArmor Review

The lab checks whether AppArmor is active and whether profiles are loaded.

The point is not to claim advanced policy tuning, but to show awareness of layered host defense and to confirm whether confinement is part of the system baseline.

## Service Reduction Review

A smaller exposed service set generally means a smaller attack surface.

For that reason, the lab reviews:
- what services are running
- what services are enabled
- what services are unnecessary for the lab
- whether disabling a service creates operational tradeoffs

## Practical Rule

Do not disable services blindly.

A service should be reduced only when:
- it is not needed for the lab
- its removal is understood
- recovery remains practical
