# SSH Hardening

## Purpose

Reduce the risk of remote-access abuse by tightening SSH configuration and verifying the changes safely.

## Lab goal

The aim of this phase is to make SSH access more defensive without locking yourself out of the VM.

This phase focuses on:
- safer SSH defaults
- root login restrictions
- reducing password-based exposure where appropriate
- validating the configuration before restart
- testing access before closing the existing session

## Before making changes

1. Confirm you have console or VM access in case SSH breaks.
2. Keep the current session open.
3. Back up the configuration file before editing.
4. If possible, prepare a second terminal session for testing.

## Recommended review steps

### 1) Inspect the current configuration
```bash
sudo grep -E '^(PermitRootLogin|PasswordAuthentication|PubkeyAuthentication|Port|AllowUsers)' /etc/ssh/sshd_config
```

### 2) Create a backup
```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```

### 3) Review the settings to change

#### PermitRootLogin
Recommended lab choice:
```text
PermitRootLogin no
```

Reason:
- reduces the chance of direct remote root access
- reinforces the use of a normal account plus sudo
- makes authentication events easier to reason about

#### PasswordAuthentication
Safer lab choice when SSH key access is ready:
```text
PasswordAuthentication no
```

More cautious transitional choice:
```text
PasswordAuthentication yes
```

Use the transitional choice only if key-based access is not ready yet.

#### PubkeyAuthentication
Recommended:
```text
PubkeyAuthentication yes
```

#### AllowUsers
Optional but useful in a small lab:
```text
AllowUsers your_username
```

Reason:
- narrows which accounts may authenticate through SSH
- reduces accidental exposure of extra accounts

## Example safe hardening path

If SSH keys are already configured and tested:
1. set `PermitRootLogin no`
2. set `PubkeyAuthentication yes`
3. set `PasswordAuthentication no`
4. optionally set `AllowUsers your_username`

If SSH keys are **not** ready:
1. set `PermitRootLogin no`
2. leave password authentication on temporarily
3. document that disabling password auth is a later improvement
4. return later after key-based access is confirmed

## Validation steps

### 1) Test the SSH daemon configuration
```bash
sudo sshd -t
```

This command should produce no output if the configuration is valid.

### 2) Restart or reload safely
```bash
sudo systemctl reload ssh
```

If reload is not available:
```bash
sudo systemctl restart ssh
```

### 3) Confirm service status
```bash
sudo systemctl status ssh --no-pager
```

### 4) Test from a second session
Open another terminal and verify you can still connect successfully before closing the current session.

## Evidence to capture

Take a screenshot of:
- `sudo sshd -t`
- `sudo systemctl status ssh --no-pager`
- the final relevant SSH configuration lines

Suggested filename:
- `screenshots/ssh-config-test.png`

## Notes for the final write-up

Document:
- whether password authentication stayed enabled or was disabled
- why that choice was made
- whether `AllowUsers` was used
- how you verified the configuration safely

## Recovery note summary

If SSH becomes inaccessible:
- use the VM console
- restore the backup config
- test with `sudo sshd -t`
- reload the SSH service again

Detailed rollback steps will go into `docs/recovery-notes.md`.
