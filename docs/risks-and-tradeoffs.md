# Risks and Tradeoffs

## Purpose

Acknowledge that hardening improves security posture, but can also increase friction, reduce convenience, or create recovery risk if applied carelessly.

This document exists to show **judgment**, not just configuration changes.

---

## Core principle

A stronger default posture is useful only if the system remains understandable, recoverable, and appropriate for its environment.

In this lab, every tightening step should answer two questions:

1. What risk does this reduce?
2. What operational cost or recovery burden does it add?

---

## Tradeoff table

| Change | Security benefit | Operational cost / risk |
| --- | --- | --- |
| Disable direct root SSH login | Reduces direct high-privilege exposure | Requires an alternate administrative path |
| Restrict or disable password SSH auth | Reduces credential-guessing surface | Can lock out access if keys are not ready |
| Default-deny firewall posture | Shrinks exposed network surface | Can interrupt remote management if rules are incomplete |
| Enable fail2ban | Adds friction for repeated abusive attempts | Can ban legitimate testing/admin access temporarily |
| Reduce enabled services | Lowers attack surface | Can break needed functionality if dependencies are missed |
| Use unattended upgrades | Improves patch hygiene | May introduce update timing or reboot planning concerns |
| Keep AppArmor active | Adds confinement visibility and layered defense | Requires investigation if a service is blocked unexpectedly |

---

## Detailed considerations

### SSH hardening
**Benefit:** lower risk of direct brute-force or high-privilege misuse.  
**Tradeoff:** if key access is not confirmed first, recovery may require console access.

### UFW default deny
**Benefit:** only explicitly needed services remain reachable.  
**Tradeoff:** one missing allow rule can affect administration or testing.

### fail2ban on SSH
**Benefit:** repeated failed login attempts become more expensive for an attacker.  
**Tradeoff:** the same mechanism can also affect legitimate testing or typo-heavy administration sessions.

### AppArmor awareness
**Benefit:** additional visibility into confinement and service behavior.  
**Tradeoff:** resolving denies may require more investigation and careful interpretation.

### Service reduction
**Benefit:** fewer active components means less exposure and less complexity.  
**Tradeoff:** aggressive disabling without dependency review can create avoidable outages.

---

## How this lab handles tradeoffs

This project uses a few rules to reduce self-inflicted problems:

- back up sensitive configs before changing them
- test SSH syntax before restart
- keep an existing session open while testing a new one
- add allow rules before enabling restrictive firewall posture
- document every keep/remove service decision
- capture evidence after each hardening phase
- include recovery notes for mistakes

---

## Reviewer takeaway

This repository should communicate that hardening is not just “more settings = better.”

The stronger signal is:

- deliberate scope
- verified changes
- explicit tradeoff acknowledgment
- practical rollback awareness

That is what makes the project look mature and credible.
