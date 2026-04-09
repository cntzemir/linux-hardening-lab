# Hardening Checklist

Use this checklist to track the lab workflow from baseline collection to verification.

## Phase 1 - Baseline
- [ ] Review OS and release information
- [ ] Record hostname and host context
- [ ] Review running services
- [ ] Review enabled services
- [ ] Review exposed ports
- [ ] Review update state
- [ ] Save baseline report

## Phase 2 - Updates and Patching
- [ ] Refresh package metadata
- [ ] Review available upgrades
- [ ] Apply intended updates
- [ ] Check reboot requirements
- [ ] Consider unattended-upgrades behavior

## Phase 3 - Users and Privilege
- [ ] Confirm non-root administrative workflow
- [ ] Review sudo usage
- [ ] Review local users and groups
- [ ] Document least-privilege decisions

## Phase 4 - SSH Hardening
- [ ] Back up SSH configuration before changes
- [ ] Review root login policy
- [ ] Review password authentication policy
- [ ] Validate SSH configuration syntax
- [ ] Restart or reload SSH safely
- [ ] Confirm access still works

## Phase 5 - Firewall and fail2ban
- [ ] Review current UFW status
- [ ] Apply minimal required rules
- [ ] Verify active firewall configuration
- [ ] Install or review fail2ban
- [ ] Verify jail visibility and service status

## Phase 6 - AppArmor and Service Reduction
- [ ] Review AppArmor status
- [ ] Review profile visibility
- [ ] Inspect enabled services
- [ ] Disable only unnecessary services
- [ ] Document every reduction decision

## Phase 7 - Verification and Documentation
- [ ] Run verification script
- [ ] Review verification results
- [ ] Document tradeoffs
- [ ] Document recovery notes
- [ ] Review README and docs for consistency
