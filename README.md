# Linux Hardening Lab

Defensive Linux hardening lab documenting secure baseline configuration, SSH hardening, firewall controls, verification steps, tradeoffs, and recovery notes on Ubuntu Server 24.04 LTS.

---

## Project overview

This repository documents a defensive Linux hardening lab built to show how a small Ubuntu Server environment can be made more secure through layered configuration, verification, and careful tradeoff analysis.

The goal is not to claim production-grade enterprise hardening. The goal is to demonstrate a reviewable, reproducible, and security-aware workflow for improving a Linux system baseline.

This lab focuses on:
- reducing unnecessary access
- hardening remote administration
- limiting exposed services
- improving brute-force resistance
- verifying changes after implementation
- documenting tradeoffs and recovery steps

---

## Outcome snapshot

This lab was built to document a reviewer-friendly defensive hardening process on Ubuntu Server rather than to claim production-grade compliance.

At a high level, the work focused on:

- reducing exposed remote administration surface
- tightening SSH-related access decisions
- limiting allowed services through a documented firewall policy
- reviewing brute-force resistance with fail2ban
- checking AppArmor and unnecessary service exposure
- recording verification evidence, tradeoffs, and recovery notes

---

## What a reviewer can verify quickly

A reviewer should be able to confirm that this repository includes:

- a baseline-before-hardening reference
- documented hardening steps with defensive scope
- verification commands and expected review points
- tradeoff notes for security-sensitive changes
- recovery guidance for rollback and access mistakes
- an intentionally educational and defensive scope, not offensive tooling

---

## Why I built this

I built this project to complement my software security work with system-level defensive thinking.

My earlier projects focused on secure application behavior such as authentication, role separation, validation, and audit logging. This lab extends that direction into Linux administration by showing how secure defaults, controlled access, firewall policy, service reduction, and verification checks can be applied on a real Ubuntu Server VM.

---

## Hardening scope

This project is intentionally scoped as an educational defensive lab.

### In scope
- Ubuntu Server baseline collection
- patching and update strategy
- user and privilege review
- SSH hardening
- UFW firewall policy
- fail2ban review and configuration
- AppArmor status and basic interpretation
- service exposure reduction
- logging and verification
- tradeoffs and recovery notes

### Out of scope
- offensive tooling
- exploit development
- persistence or privilege escalation techniques
- production-grade compliance claims
- advanced kernel hardening
- enterprise-scale monitoring or SIEM integration

---

## Target environment

- Operating system: Ubuntu Server 24.04 LTS
- Environment type: local virtual machine
- Primary goal: defensive configuration and verification
- Audience: reviewers, admissions readers, and anyone evaluating practical security reasoning

---

## Baseline before hardening

Before applying changes, I captured a baseline covering:
- system identity and kernel version
- logged-in user and privilege context
- listening ports
- active services
- package and update state
- firewall status
- SSH configuration highlights
- AppArmor status

The baseline report is generated from:

```bash
bash scripts/collect-baseline.sh
```

This keeps the workflow grounded in before-and-after review rather than undocumented configuration drift.

---

## Hardening steps applied

### 1. Updates and patching
- refreshed package metadata
- applied available updates
- reviewed automatic security update behavior
- recorded reboot implications where relevant

### 2. Users and privilege
- reviewed active user context
- confirmed non-root administrative workflow
- documented least-privilege rationale

### 3. SSH hardening
- reviewed `sshd_config`
- tested configuration syntax with `sshd -t`
- restricted risky remote access settings
- documented safe restart and verification flow

### 4. Firewall and brute-force resistance
- reviewed default UFW policy
- limited allowed services to required ports only
- documented firewall state after changes
- reviewed fail2ban coverage for SSH-related abuse

### 5. AppArmor and service reduction
- reviewed AppArmor status
- checked loaded profiles
- identified avoidable service exposure
- documented service reduction decisions

### 6. Verification and logging
- ran scripted checks after hardening
- reviewed SSH, firewall, and fail2ban status
- recorded evidence in notes and verification output

---

## Verification workflow

After applying the hardening changes, verify the system with:

```bash
bash scripts/verify-hardening.sh
cat notes/verification-report.txt
```

Recommended review points:
- `sshd -t` returns no configuration error
- SSH policy matches documented decisions
- UFW is enabled with intentional allow rules only
- fail2ban is active and monitoring SSH-related behavior
- AppArmor is enabled and profiles are loaded
- unnecessary services are reduced or explicitly justified

---

## Risks and tradeoffs

Hardening improves security, but it also introduces operational tradeoffs.

Examples documented in this repository:
- stricter SSH settings can lock out legitimate access if applied carelessly
- aggressive firewall policy can interrupt expected connectivity
- fail2ban can accidentally block valid testing activity
- disabling services can break workflows if dependency mapping is incomplete
- AppArmor restrictions can require additional troubleshooting

See the detailed tradeoff notes in [docs/risks-and-tradeoffs.md](docs/risks-and-tradeoffs.md).

---

## Recovery notes

This project treats recovery planning as part of hardening quality.

Recovery guidance includes:
- reverting SSH changes safely
- correcting UFW rules without losing access
- handling accidental fail2ban lockouts
- reviewing AppArmor-related issues
- validating service restart behavior after rollback

See [docs/recovery-notes.md](docs/recovery-notes.md).

---

## Evidence and documentation

This repository is intentionally documentation-heavy. The main evidence lives in the hardening notes, scripts, and verification outputs.

Available documentation:
- [Baseline](docs/baseline.md)
- [Hardening checklist](docs/hardening-checklist.md)
- [Users and privilege](docs/users-and-privilege.md)
- [SSH hardening](docs/ssh-hardening.md)
- [Firewall and fail2ban](docs/firewall-and-fail2ban.md)
- [Updates and patching](docs/updates-and-patching.md)
- [AppArmor and service reduction](docs/apparmor-and-service-reduction.md)
- [Logging and verification](docs/logging-and-verification.md)
- [Risks and tradeoffs](docs/risks-and-tradeoffs.md)
- [Recovery notes](docs/recovery-notes.md)
- [GitHub release checklist](docs/github-release-checklist.md)
- [Command reference](notes/command-reference.md)

---

## Reproduce in a VM

1. Create an Ubuntu Server 24.04 LTS VM
2. Clone this repository into the VM
3. Run the baseline collection script
4. Apply the documented hardening steps gradually
5. Re-run the verification script
6. Review the generated notes and verification output

---

## Known limitations

- This is an educational lab, not a production baseline
- Results depend on the starting state of the VM
- Some hardening decisions are intentionally conservative to reduce lockout risk
- The repository does not attempt advanced kernel, container, or enterprise directory hardening
- Verification is practical and reviewer-friendly, but not a compliance benchmark

---

## Future improvements

- extend the verification script with more checks
- add benchmark mapping against CIS-style controls
- add rollback automation for selected safe changes
- add comparison notes for Debian or Rocky Linux
- add optional auditd coverage
