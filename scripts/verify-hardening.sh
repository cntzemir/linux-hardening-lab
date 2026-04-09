#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="notes"
OUT_FILE="$OUT_DIR/verification-report.txt"
mkdir -p "$OUT_DIR"

{
  echo "Linux Hardening Lab - Verification Report"
  echo "Generated: $(date -Is)"
  echo

  echo "== SSH Configuration File Presence =="
  if [ -f /etc/ssh/sshd_config ]; then
    echo "/etc/ssh/sshd_config exists"
  else
    echo "/etc/ssh/sshd_config missing"
  fi
  echo

  echo "== SSH Syntax Test =="
  if command -v sshd >/dev/null 2>&1; then
    sudo sshd -t 2>&1 || true
  else
    echo "sshd not available"
  fi
  echo

  echo "== SSH Root Login Directive =="
  grep -Ei '^[[:space:]]*PermitRootLogin' /etc/ssh/sshd_config 2>/dev/null || echo "PermitRootLogin not explicitly set"
  echo

  echo "== SSH Password Authentication Directive =="
  grep -Ei '^[[:space:]]*PasswordAuthentication' /etc/ssh/sshd_config 2>/dev/null || echo "PasswordAuthentication not explicitly set"
  echo

  echo "== UFW Status =="
  if command -v ufw >/dev/null 2>&1; then
    sudo ufw status verbose 2>/dev/null || ufw status verbose 2>/dev/null || true
  else
    echo "ufw not installed"
  fi
  echo

  echo "== fail2ban Service Status =="
  if systemctl list-unit-files | grep -q '^fail2ban.service'; then
    sudo systemctl status fail2ban --no-pager 2>/dev/null || systemctl status fail2ban --no-pager 2>/dev/null || true
  else
    echo "fail2ban service not installed"
  fi
  echo

  echo "== fail2ban Client Status =="
  if command -v fail2ban-client >/dev/null 2>&1; then
    sudo fail2ban-client status 2>/dev/null || fail2ban-client status 2>/dev/null || true
  else
    echo "fail2ban-client not available"
  fi
  echo

  echo "== AppArmor Status =="
  if command -v aa-status >/dev/null 2>&1; then
    sudo aa-status 2>/dev/null || aa-status 2>/dev/null || true
  else
    echo "aa-status not available"
  fi
  echo

  echo "== Listening Ports =="
  ss -tulpn 2>/dev/null || true
  echo

  echo "== Running Services =="
  systemctl list-units --type=service --state=running 2>/dev/null || true
} > "$OUT_FILE"

echo "Verification report written to $OUT_FILE"
