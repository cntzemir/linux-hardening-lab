# AppArmor and Service Reduction

## Purpose

Reduce exposure by reviewing **mandatory access control visibility** and limiting unnecessary enabled services.

This phase is not about aggressively turning everything off.  
It is about making deliberate, documented decisions about what the system actually needs.

---

## Why this matters

Even a small lab system benefits from two ideas:

- **confinement awareness**: understanding what AppArmor is doing and how to recognize denies
- **surface reduction**: fewer enabled services usually means fewer reachable or misconfigurable components

Together, these reduce risk without adding unnecessary complexity.

---

## AppArmor review

### Goals
- confirm whether AppArmor is enabled
- inspect loaded profiles
- understand where deny events would appear
- record evidence without changing profile behavior blindly

### Useful commands
```bash
aa-status
systemctl status apparmor --no-pager
journalctl -k | grep -i apparmor
journalctl --since "today" | grep -i DENIED
```

### What to document
- whether AppArmor is active
- how many profiles are loaded or enforced
- whether deny messages appear during the lab
- whether any service-specific issue needs follow-up

### Good evidence
- `aa-status` output
- AppArmor service status
- a note explaining whether deny logs were observed

---

## Service reduction

### Goal
Review enabled services and keep only what is justified for the lab.

### Important rule
Do **not** disable services casually.  
Especially on a VM you access remotely, always verify that a service is truly unnecessary before disabling it.

### Discovery commands
```bash
systemctl list-unit-files --type=service --state=enabled
systemctl list-units --type=service --state=running
ss -tulpn
```

### Decision process
For each service:
1. identify what it does
2. decide whether the lab requires it
3. document the reason to keep or remove it
4. disable only if you can justify the change
5. verify the system still behaves as expected afterward

### Examples of safe thinking
- keep `ssh` if the VM is managed remotely
- keep time synchronization services if needed by the system
- do not remove networking services blindly
- consider disabling software that was enabled by default but is not used in the lab

---

## Example decision log

| Item | Decision | Reason |
| --- | --- | --- |
| SSH service | Keep | Required for administrative access and SSH hardening validation |
| Unused enabled service | Disable only after confirmation | Exposure reduction if not required by the lab |
| AppArmor service | Keep | Improves confinement visibility and layered defense |

---

## Suggested implementation approach

### AppArmor
1. confirm status with `aa-status`
2. inspect service status
3. look for deny messages in the journal
4. save evidence to screenshots and notes

### Service reduction
1. capture enabled services before changes
2. mark candidates for review
3. disable only after dependency review
4. test access and system stability
5. record the final decision and its reason

---

## Verification ideas
- AppArmor shows as active or enabled
- loaded/enforced profile information is visible
- enabled service list is shorter or better justified than before
- remote/admin access still works after any service changes

---

## Notes for the lab report

In this project, AppArmor is treated as part of a **layered defensive baseline**, while service reduction is treated as part of **attack-surface management**.

The strongest signal for reviewers is not the number of services removed.  
It is the quality of the reasoning behind each keep/remove decision.
