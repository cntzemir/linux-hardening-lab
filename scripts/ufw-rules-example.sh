#!/usr/bin/env bash
set -euo pipefail

# Example UFW policy for the lab.
# Review each line before using it on the VM.

echo "Applying example UFW rules for the Linux hardening lab..."

sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH. Change the port if your SSH daemon uses a custom one.
sudo ufw allow 22/tcp comment 'OpenSSH'

# Optional examples for future services.
# sudo ufw allow 80/tcp comment 'HTTP'
# sudo ufw allow 443/tcp comment 'HTTPS'

sudo ufw enable
sudo ufw status verbose
