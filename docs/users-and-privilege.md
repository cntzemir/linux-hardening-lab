# Users and Privilege

## Purpose

This document records the least-privilege thinking used in the lab.

The goal is to avoid unnecessary privileged access and make administration more deliberate.

## Main Review Areas

- use of a normal administrative user instead of direct root activity
- controlled sudo access
- review of local accounts
- review of groups and privilege boundaries
- avoidance of unnecessary privilege persistence

## Security Rationale

Not every task should run with full privilege.

Separating routine administration from root-level behavior reduces the chance of accidental damage and encourages more explicit control over high-impact actions.

## Practical Mindset

The lab treats least privilege as a habit, not only a rule.

That means:
- normal administration should prefer a non-root account
- elevation should be intentional
- unnecessary privileged access should be avoided
- changes should be documented with operational clarity

## Tradeoff Reminder

Very strict access control can increase administrative friction, so the lab keeps the focus on sensible reduction rather than complexity for its own sake.
