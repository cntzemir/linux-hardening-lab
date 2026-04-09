# Hardening Checklist

Use this checklist as a phase-by-phase progress tracker.

## Phase 1 — Baseline and updates
- [ ] baseline collected with `collect-baseline.sh`
- [ ] OS, kernel, hostname, IP, memory, disk noted
- [ ] enabled services reviewed
- [ ] listening ports reviewed
- [ ] package update state checked
- [ ] updates applied
- [ ] unattended-upgrades posture documented

## Phase 2 — Users and privilege
- [ ] non-root admin workflow documented
- [ ] local account expectations documented
- [ ] sudo posture explained
- [ ] least-privilege reasoning written

## Phase 3 — SSH hardening
- [ ] SSH config backed up
- [ ] config syntax tested with `sshd -t`
- [ ] direct root login policy reviewed
- [ ] password authentication policy reviewed
- [ ] remote access tested safely before old session closed
- [ ] SSH evidence captured

## Phase 4 — Firewall and fail2ban
- [ ] UFW rules decided intentionally
- [ ] only necessary services allowed
- [ ] UFW status reviewed
- [ ] fail2ban installed/configured
- [ ] jail/service status checked
- [ ] firewall/fail2ban screenshots captured

## Phase 5 — AppArmor and service reduction
- [ ] AppArmor status checked
- [ ] loaded profiles reviewed
- [ ] deny-event awareness documented
- [ ] enabled services reviewed for reduction candidates
- [ ] unnecessary services documented and reduced carefully
- [ ] AppArmor evidence captured

## Phase 6 — Logging and verification
- [ ] SSH logs reviewed
- [ ] fail2ban logs reviewed
- [ ] AppArmor-related logs reviewed
- [ ] verification script run
- [ ] `notes/verification-report.txt` saved
- [ ] verification screenshot captured

## Phase 7 — Tradeoffs and recovery
- [ ] tradeoff reasoning documented
- [ ] SSH recovery notes written
- [ ] UFW recovery notes written
- [ ] fail2ban recovery notes written
- [ ] AppArmor/service-recovery notes written

## Final presentation
- [ ] README reflects actual implementation
- [ ] screenshots folder is populated
- [ ] docs folder is complete
- [ ] no sensitive data is committed
