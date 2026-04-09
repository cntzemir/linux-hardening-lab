#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NOTES_DIR="${PROJECT_ROOT}/notes"
OUTPUT_FILE="${NOTES_DIR}/verification-report.txt"

mkdir -p "${NOTES_DIR}"

run_cmd() {
  local title="$1"
  shift
  echo
  echo "## ${title}" >> "${OUTPUT_FILE}"
  echo "\$ $*" >> "${OUTPUT_FILE}"
  if "$@" >> "${OUTPUT_FILE}" 2>&1; then
    true
  else
    echo "[check returned non-zero status]" >> "${OUTPUT_FILE}"
  fi
}

run_shell() {
  local title="$1"
  local cmd="$2"
  echo
  echo "## ${title}" >> "${OUTPUT_FILE}"
  echo "\$ ${cmd}" >> "${OUTPUT_FILE}"
  if bash -lc "${cmd}" >> "${OUTPUT_FILE}" 2>&1; then
    true
  else
    echo "[check returned non-zero status]" >> "${OUTPUT_FILE}"
  fi
}

echo "# Verification Report" > "${OUTPUT_FILE}"
echo "Generated: $(date -Iseconds)" >> "${OUTPUT_FILE}"

run_cmd "OS Release" cat /etc/os-release
run_cmd "Kernel" uname -r
run_cmd "Current User" id

if [[ -f /etc/ssh/sshd_config ]]; then
  run_shell "SSH Relevant Settings" "grep -E '^(PermitRootLogin|PasswordAuthentication|PubkeyAuthentication|AllowUsers)' /etc/ssh/sshd_config || true"
  if command -v sshd >/dev/null 2>&1; then
    run_cmd "SSH Config Syntax Test" sshd -t
  fi
fi

if command -v systemctl >/dev/null 2>&1; then
  run_cmd "SSH Service Status" systemctl status ssh --no-pager
  run_cmd "SSH Service Enabled State" systemctl is-enabled ssh
  run_cmd "Fail2ban Service Status" systemctl status fail2ban --no-pager
  run_cmd "Fail2ban Enabled State" systemctl is-enabled fail2ban
  run_cmd "AppArmor Service Status" systemctl status apparmor --no-pager
  run_cmd "AppArmor Enabled State" systemctl is-enabled apparmor
  run_shell "Enabled Services Snapshot" "systemctl list-unit-files --type=service --state=enabled | sed -n '1,80p'"
fi

if command -v ufw >/dev/null 2>&1; then
  run_cmd "UFW Status Verbose" ufw status verbose
fi

if command -v fail2ban-client >/dev/null 2>&1; then
  run_cmd "Fail2ban Overall Status" fail2ban-client status
  run_cmd "Fail2ban SSH Jail Status" fail2ban-client status sshd
fi

if command -v aa-status >/dev/null 2>&1; then
  run_cmd "AppArmor Status" aa-status
fi

run_shell "Recent SSH Journal" "journalctl -u ssh -n 40 --no-pager || journalctl -u sshd -n 40 --no-pager || true"
run_shell "Recent fail2ban Journal" "journalctl -u fail2ban -n 40 --no-pager || true"
run_shell "Recent AppArmor Kernel Messages" "journalctl -k -n 80 --no-pager | grep -i apparmor || true"

if [[ -f /var/log/auth.log ]]; then
  run_shell "Auth Log SSH Failures" "grep -i 'Failed password' /var/log/auth.log | tail -n 20 || true"
  run_shell "Auth Log Successful SSH" "grep -i 'Accepted' /var/log/auth.log | tail -n 20 || true"
fi

echo
echo "Verification report written to: ${OUTPUT_FILE}"
