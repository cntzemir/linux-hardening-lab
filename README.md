# Linux Hardening Lab

Defensive Linux hardening lab documenting secure baseline configuration, SSH hardening, firewall controls, verification steps, tradeoffs, and recovery notes on Ubuntu Server.

## Project Overview

This repository documents a practical Linux hardening workflow performed on Ubuntu Server with a defensive mindset.

The goal of the project is not to present a production-ready enterprise standard, but to show how a system can be reviewed, reduced, hardened, verified, and documented in a structured way. The focus is on secure baseline configuration, access reduction, service exposure control, authentication hardening, host-level protections, and clear recovery notes.

This project is positioned as a security learning and documentation lab built to reflect practical system-security thinking rather than offensive tooling or attack automation.

## Why I Built This

I built this project to strengthen the systems side of my portfolio.

My recent work has increasingly focused on secure software behavior, authentication, authorization, logging, and defensive design. This lab extends that direction into Linux system configuration by documenting how to reduce attack surface, harden remote access, control network exposure, verify protections, and think through recovery and tradeoff scenarios.

The project reflects my transition from general web development toward more security-aware software and systems work.

## Scope and Goal

This lab focuses on:
- Ubuntu Server baseline review
- update and patching hygiene
- user and privilege review
- SSH hardening
- UFW firewall configuration
- fail2ban setup for brute-force resistance
- AppArmor visibility
- service exposure reduction
- verification and written documentation
- risks, tradeoffs, and recovery notes

This lab does **not** aim to cover:
- offensive exploitation
- malware development
- attack automation
- enterprise-scale hardening guarantees
- advanced kernel-level hardening
- production deployment certification

## Target Environment

- Operating System: Ubuntu Server 24.04 LTS
- Lab Type: local virtual machine hardening lab
- Focus: defensive configuration, verification, and documentation

## Hardening Areas Covered

### 1. Baseline Review
The project begins with system baseline collection so that configuration changes can be compared against an initial state. This includes host information, service exposure, update state, and firewall-related observations.

### 2. Updates and Patching
The system is reviewed for update state and patching hygiene, including package updates and automatic security update considerations.

### 3. Users and Privilege
The lab emphasizes root avoidance, controlled sudo use, and least-privilege thinking for normal administration.

### 4. SSH Hardening
SSH configuration is reviewed and tightened to reduce remote access risk. This includes root-login policy, password-authentication considerations, configuration validation, and access-control reasoning.

### 5. Firewall and Access Reduction
UFW is used to reduce exposed network surface and allow only the access required for the lab.

### 6. Brute-Force Resistance
fail2ban is included to add a basic protective layer around repeated authentication abuse patterns.

### 7. AppArmor and Service Reduction
The project also documents AppArmor visibility and the review of running or enabled services in order to reduce unnecessary exposure.

### 8. Verification
The goal is not only to apply changes, but also to verify them through repeatable checks and documented results.

## Verification Approach

Verification in this lab is based on practical checks such as:
- SSH configuration validation
- firewall status review
- fail2ban status checks
- AppArmor status review
- service exposure inspection
- scripted verification output

The repository includes scripts and notes intended to support repeatable review rather than one-time manual configuration only.

## Repository Structure

```text
linux-hardening-lab/
├── README.md
├── CHANGELOG.md
├── LICENSE
├── SECURITY.md
├── .gitignore
├── docs/
│   ├── baseline.md
│   ├── hardening-checklist.md
│   ├── users-and-privilege.md
│   ├── ssh-hardening.md
│   ├── firewall-and-fail2ban.md
│   ├── updates-and-patching.md
│   ├── apparmor-and-service-reduction.md
│   ├── logging-and-verification.md
│   ├── risks-and-tradeoffs.md
│   └── recovery-notes.md
├── notes/
│   └── command-reference.md
├── scripts/
│   ├── collect-baseline.sh
│   ├── verify-hardening.sh
│   └── ufw-rules-example.sh
└── screenshots/
```

## Documentation

- [Baseline](docs/baseline.md)
- [Updates and Patching](docs/updates-and-patching.md)
- [Users and Privilege](docs/users-and-privilege.md)
- [SSH Hardening](docs/ssh-hardening.md)
- [Firewall and fail2ban](docs/firewall-and-fail2ban.md)
- [AppArmor and Service Reduction](docs/apparmor-and-service-reduction.md)
- [Logging and Verification](docs/logging-and-verification.md)
- [Risks and Tradeoffs](docs/risks-and-tradeoffs.md)
- [Recovery Notes](docs/recovery-notes.md)
- [Hardening Checklist](docs/hardening-checklist.md)
- [Command Reference](notes/command-reference.md)

## Reproducing the Lab

This repository is intended to be reviewed alongside a local Ubuntu Server VM.

Suggested flow:
1. Prepare an Ubuntu Server 24.04 LTS virtual machine
2. Review the baseline configuration
3. Apply update and privilege-related steps
4. Harden SSH access
5. Configure UFW rules
6. Configure fail2ban
7. Review AppArmor and running services
8. Run verification checks
9. Document tradeoffs and recovery notes

## Scripts

### `scripts/collect-baseline.sh`
Collects basic baseline information to support before/after comparison.

### `scripts/verify-hardening.sh`
Runs practical verification checks related to SSH, firewall, fail2ban, AppArmor, and exposure review.

### `scripts/ufw-rules-example.sh`
Contains example firewall rule patterns used as a reference during the lab.

## Security Mindset Behind the Project

This repository is designed around a few core ideas:
- reduce attack surface before adding complexity
- prefer explicit access decisions over permissive defaults
- separate normal administration from root-level behavior
- document why a hardening choice helps, not only how to enable it
- verify changes after applying them
- keep recovery paths visible in case a hardening change causes operational friction

## Risks and Tradeoffs

Hardening improves security posture, but it can also introduce usability and recovery costs.

Examples include:
- accidental lockout after SSH changes
- denied access caused by over-restrictive firewall rules
- operational overhead introduced by tighter authentication controls
- troubleshooting complexity when multiple security layers interact

For that reason, the repository includes a dedicated tradeoff and recovery section instead of presenting hardening as a checklist without consequences.

## Known Limitations

- This is a learning-focused lab, not a production baseline
- The verification process is practical and limited in scope
- Configuration depth is intentionally moderate rather than enterprise-grade
- Some controls are documented conceptually unless fully applied in the current VM iteration
- Results can vary depending on VM platform, network mode, and Ubuntu defaults

## Future Improvements

- add screenshots from the verification workflow
- expand service-exposure review with more before/after evidence
- add more structured before/after baseline comparison output
- include a stronger rollback validation section
- extend verification checks for additional host-hardening controls

## Author

**Emir Canitez**

Computer Science student in Budapest building a portfolio around secure software, defensive design, and practical system-security learning.
