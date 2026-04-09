#!/usr/bin/env bash
set -euo pipefail

if [ "$(uname -s)" != "Linux" ]; then
  echo "Error: this script must be run inside the Ubuntu Linux VM."
  echo "Open a terminal in the Ubuntu guest and run:"
  echo "  bash scripts/collect-baseline.sh"
  exit 1
fi

OUT_DIR="notes"
OUT_FILE="${OUT_DIR}/baseline-report.txt"
mkdir -p "${OUT_DIR}"

{
  echo "Linux Hardening Lab - Baseline Report"
  echo "Generated: $(date -Is)"
  echo

  echo "== System identity =="
  echo "Hostname: $(hostname)"
  echo "Kernel: $(uname -r)"
  echo "Architecture: $(uname -m)"
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS: ${PRETTY_NAME:-unknown}"
  fi
  echo

  echo "== Current session =="
  echo "Current user: $(whoami)"
  echo "Uptime:"
  uptime
  echo

  echo "== Network addresses =="
  ip -brief addr 2>/dev/null || true
  echo

  echo "== Listening sockets =="
  ss -tulpn 2>/dev/null || ss -tuln 2>/dev/null || true
  echo

  echo "== Users in sudo group =="
  getent group sudo || true
  echo

  echo "== Current accounts =="
  getent passwd
  echo

  echo "== Disk usage =="
  df -h
  echo

  echo "== Memory =="
  free -h
  echo

  echo "== Enabled services =="
  systemctl list-unit-files --type=service --state=enabled 2>/dev/null | sed -n '1,100p' || true
  echo

  echo "== Running services =="
  systemctl list-units --type=service --state=running 2>/dev/null | sed -n '1,120p' || true
  echo

  echo "== Upgradable packages =="
  apt list --upgradable 2>/dev/null || true
  echo

  echo "== Reboot required =="
  if [ -f /var/run/reboot-required ]; then
    echo "yes"
  else
    echo "no"
  fi
  echo
} > "${OUT_FILE}"

echo "Baseline report written to ${OUT_FILE}"
echo "Review it with: cat ${OUT_FILE}"
