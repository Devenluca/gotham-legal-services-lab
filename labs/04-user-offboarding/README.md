# Lab 04 — User offboarding

**Status:** Account disablement and session revocation evidenced; final group removal needs verification.

## Scenario

Offboard the fictional employee Jason Todd from Gotham Legal Services. Review his account and group membership, disable sign-in, remove group access, revoke sessions, and inspect audit records.

## Recorded workflow

1. Review the account's initially enabled status.
2. Inspect the Groups page, which lists the assigned **Security** group.
3. Open the account properties. The supplied settings capture still shows Account enabled checked; this is a before-change view.
4. A later Overview capture shows **Disabled**. Audit details also record a successful **Disable account** event on October 3, 2026.
5. Initiate removal from Security. The supplied screenshot shows the removal confirmation prompt while the group row remains visible. A refreshed empty membership view or successful removal audit event was not supplied.
6. Initiate session revocation. The confirmation prompt records the intended action; a subsequent audit detail shows successful **Update StsRefreshTokenValidFrom Timestamp**, supporting the revocation operation.
7. Review the audit overview and individual successful events.

## Validation

| Check | Evidence and conclusion |
| --- | --- |
| Account initially enabled | Before-state Overview |
| Account disabled | Later Overview plus successful Disable account audit event |
| Initial direct group membership | Security listed in Groups |
| Group removal initiated | Confirmation prompt captured |
| Final absence of group membership | Not verified by supplied evidence |
| Session revocation | Confirmation prompt plus successful timestamp-update audit event |
| Application sessions or existing access tokens terminated | Not tested |
| Licensing, mailbox, devices, data retention, and application access | Outside supplied evidence |

Microsoft's [revoke user access guidance](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access) explains account disablement and revocation, including application session considerations. Successful revocation does not by itself prove that every application session immediately ended.

## Evidence

See the [eleven sanitized screenshots](../../screenshots/04-user-offboarding/README.md). Tenant addresses, object and correlation IDs, administrator identifiers, IP addresses, and user-agent details are masked where present. Fictional employee names, group context, activity names, and statuses remain visible.

## Lessons and remaining work

A confirmation prompt proves intent, while a refreshed state or successful audit record provides stronger outcome evidence. Refresh Jason's Groups view and record the final membership state before marking group removal complete. Review any service-specific offboarding requirements separately.

## Recovery

If an offboarding action was applied in error, restore account access and necessary group memberships only after an authorized review against the original baseline. Revoked sessions require fresh authentication. No recovery operation is claimed here.
