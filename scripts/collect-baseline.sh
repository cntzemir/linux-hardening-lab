#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="notes"
OUT_FILE="$OUT_DIR/baseline-report.txt"
mkdir -p "$OUT_DIR"

{
  echo "Linux Hardening Lab - Baseline Report"
  echo "Generated: $(date -Is)"
  echo

  echo "== Host Information =="
  hostnamectl 2>/dev/null || true
  echo

  echo "== Kernel =="
  uname -a
  echo

  echo "== OS Release =="
  if command -v lsb_release >/dev/null 2>&1; then
    lsb_release -a 2>/dev/null || true
  elif [ -f /etc/os-release ]; then
    cat /etc/os-release
  fi
  echo

  echo "== Current User =="
  whoami
  id
  echo

  echo "== IP Addresses =="
  hostname -I 2>/dev/null || true
  ip addr 2>/dev/null || true
  echo

  echo "== Listening Ports =="
  ss -tulpn 2>/dev/null || true
  echo

  echo "== Running Services =="
  systemctl list-units --type=service --state=running 2>/dev/null || true
  echo

  echo "== Enabled Service Unit Files =="
  systemctl list-unit-files --type=service 2>/dev/null || true
  echo

  echo "== Upgradable Packages =="
  apt list --upgradable 2>/dev/null || true
  echo

  echo "== UFW Status =="
  if command -v ufw >/dev/null 2>&1; then
    sudo ufw status verbose 2>/dev/null || ufw status verbose 2>/dev/null || true
  else
    echo "ufw not installed"
  fi
  echo

  echo "== AppArmor Status =="
  if command -v aa-status >/dev/null 2>&1; then
    sudo aa-status 2>/dev/null || aa-status 2>/dev/null || true
  else
    echo "aa-status not available"
  fi
} > "$OUT_FILE"

echo "Baseline report written to $OUT_FILE"
