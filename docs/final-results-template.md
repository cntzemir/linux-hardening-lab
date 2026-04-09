# Final Results Template

Use this file as a drafting worksheet before you update the public README and docs with your real results.

## Environment summary
- VM platform:
- Ubuntu version:
- Hostname:
- Kernel:
- Primary user:
- Private lab IP:

## Baseline notes
- Open ports before hardening:
- Firewall state before hardening:
- SSH concerns before hardening:
- Notable running services before hardening:

## Hardening summary
- Updates applied:
- Automatic updates configured:
- SSH changes applied:
- Firewall rules applied:
- fail2ban status:
- AppArmor status:
- Services reduced or disabled:

## Verification summary
- `sshd -t` result:
- `ufw status verbose` result:
- `fail2ban-client status` result:
- AppArmor verification result:
- Verification script result:

## Tradeoffs observed
- Access tradeoff:
- Usability tradeoff:
- Administrative overhead:
- Recovery concern:

## Recovery notes confirmed
- SSH rollback path tested:
- Firewall rollback understood:
- fail2ban lockout handling understood:
- AppArmor troubleshooting note:

## Screenshots ready
- baseline-system-info.png
- ssh-config-test.png
- ufw-status.png
- fail2ban-status.png
- apparmor-status.png
- verification-script.png
