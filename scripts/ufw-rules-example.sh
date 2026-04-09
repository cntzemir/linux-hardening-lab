#!/usr/bin/env bash
# Example UFW rule reference for the lab.
# Review carefully before running on a real system.

set -euo pipefail

echo "Example commands only. Review before use."
echo "sudo ufw default deny incoming"
echo "sudo ufw default allow outgoing"
echo "sudo ufw allow OpenSSH"
echo "sudo ufw enable"
echo "sudo ufw status verbose"
