# Gotham Legal Services Lab

A Microsoft Entra ID and Microsoft 365 administration portfolio using the fictional company **Gotham Legal Services**.

This repository documents practical IT support, identity administration, troubleshooting, automation, and technical documentation. Employee identities and scenarios are fictional; administrator and tenant identifiers are redacted from published evidence. Work is performed in a dedicated lab tenant.

## Repository structure

| Folder | Purpose |
| --- | --- |
| `docs/` | Environment notes, documentation standards, and reusable templates |
| `screenshots/` | Redacted evidence organized by lab |
| `scripts/` | PowerShell automation and verification tools |
| `csv/` | Fictional user data and membership planning templates |
| `labs/` | Scenario walkthroughs, validation, and lessons learned |

## Labs

| Lab | Status | Skills |
| --- | --- | --- |
| [01 — User lifecycle](labs/01-user-lifecycle/README.md) | Membership evidence published; remaining validation pending | User creation, security groups, department transfer, access removal, verification |
| [02 — Bulk user creation](labs/02-bulk-user-creation/README.md) | Import failures and subsequent creation documented | CSV preparation, validation, import troubleshooting |
| [03 — PowerShell automation attempt](labs/03-powershell-user-automation/README.md) | Blocked by local script execution policy | Microsoft Graph, repeatable operations, reporting |
| [04 — User offboarding](labs/04-user-offboarding/README.md) | Disablement and revocation evidenced; group removal verification pending | Account disablement, access review, session handling |
| Password resets | Planned | Identity verification, secure reset workflows |
| Group management | Planned | Membership administration and access troubleshooting |
| Microsoft 365 administration | Planned | Service administration and licensing |
| Intune / device management | Possible future scope | Device enrollment and management |

## Start here

1. Complete [environment notes](docs/environment.md).
2. Follow the [first lab](labs/01-user-lifecycle/README.md).
3. Add redacted screenshots and record actual results.
4. Use the [verification script](scripts/Test-UserLifecycle.ps1) to check the scoped final state.

Scripts and walkthroughs are portfolio examples. Labs 01–04 include supplied, sanitized evidence. Each walkthrough distinguishes observed outcomes, failures, and remaining validation. Do not commit passwords, tokens, real client information, or unredacted administrative screenshots.
