# AppArmor and Service Reduction

## Purpose

This document records the host-level review of AppArmor visibility and unnecessary service exposure.

The goal is to show that hardening is not only about adding controls, but also about reducing what the system exposes and understanding what is already active.

## AppArmor Review Areas

The AppArmor part of the lab focuses on:
- confirming whether AppArmor is enabled
- reviewing visible profile status
- understanding deny events or enforcement context where applicable
- recognizing AppArmor as a host-level containment layer

## Service Reduction Areas

The service review focuses on:
- enabled services
- actively running services
- whether each service is required for the lab
- whether any service should be disabled or removed from the default footprint

## Security Rationale

A system with fewer exposed or unnecessary services is generally easier to understand, monitor, and defend.

Reducing the number of active components can lower the attack surface and simplify troubleshooting.

## Documentation Mindset

Changes in this area should always be recorded with:
- what the service did
- why it was kept or removed
- whether the decision affects lab functionality
- how to reverse the change if needed
