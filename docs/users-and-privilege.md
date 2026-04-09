# Users and Privilege

## Purpose

This document explains the user and privilege model used in the lab.

The focus is on minimizing unnecessary privileged behavior and documenting a clean non-root administrative workflow.

## Main Ideas

- avoid direct root usage for normal administration
- use sudo deliberately rather than casually
- keep privilege boundaries understandable
- document why a choice improves safety, not only how it is configured

## Review Areas

The user and privilege review in this lab focuses on:
- active user context
- group membership
- sudo usage
- whether administrative tasks can be performed without normal root login habits
- whether unnecessary privileged exposure is reduced

## Security Rationale

Least privilege is one of the most useful baseline security ideas because it narrows the impact of mistakes and makes administrative actions more intentional.

This does not remove all risk, but it reduces how casually high privilege is used.

## Practical Reminder

Hardening should still remain recoverable.

Privilege decisions that reduce risk should also leave a safe path for maintenance, troubleshooting, and rollback inside the lab.
