# Hardening Checklist

Use this checklist to review the lab end to end.

## Baseline
- [ ] baseline report generated
- [ ] listening ports reviewed
- [ ] active services reviewed
- [ ] initial firewall state reviewed
- [ ] SSH defaults reviewed
- [ ] AppArmor status reviewed

## Updates and Patching
- [ ] package metadata refreshed
- [ ] available updates applied
- [ ] automatic security update behavior reviewed
- [ ] reboot implications checked

## Users and Privilege
- [ ] non-root administration confirmed
- [ ] sudo use reviewed
- [ ] least-privilege rationale documented

## SSH Hardening
- [ ] configuration backup taken
- [ ] `sshd_config` reviewed
- [ ] configuration tested with `sshd -t`
- [ ] risky defaults reduced
- [ ] access verified after restart

## Firewall and fail2ban
- [ ] UFW policy reviewed
- [ ] only required ports allowed
- [ ] firewall status verified
- [ ] fail2ban installed or reviewed
- [ ] SSH-related jail visibility confirmed

## AppArmor and Service Reduction
- [ ] AppArmor status checked
- [ ] loaded profiles reviewed
- [ ] unnecessary services identified
- [ ] service reduction decisions documented

## Verification
- [ ] verification script executed
- [ ] verification report reviewed
- [ ] SSH state confirmed
- [ ] firewall state confirmed
- [ ] fail2ban state confirmed
- [ ] AppArmor state confirmed

## Documentation Quality
- [ ] tradeoffs documented
- [ ] recovery notes documented
- [ ] README aligned with final repo state
- [ ] no placeholders left in public-facing files
