# Lab 04 — User offboarding

**Status:** Offboarding workflow documented: account disablement, Security group removal, and session revocation.

## Scenario

Offboard the fictional employee Jason Todd from Gotham Legal Services. Review his account and group membership, disable sign-in, remove group access, revoke sessions, and inspect audit records.

## Recorded workflow

1. Review the account's initially enabled status.
2. Inspect the Groups page, which lists the assigned **Security** group.
3. Open the account properties. The supplied settings capture still shows Account enabled checked; this is a before-change view.
4. A later Overview capture shows **Disabled**. Audit details also record a successful **Disable account** event on October 3, 2026.
5. Remove Jason from Security as part of the offboarding workflow. The supplied screenshot captures the confirmation step for removing this membership.
6. Initiate session revocation. The confirmation prompt records the intended action; a subsequent audit detail shows successful **Update StsRefreshTokenValidFrom Timestamp**, supporting the revocation operation.
7. Review the audit overview and individual successful events.

## Validation

| Check | Evidence and conclusion |
| --- | --- |
| Account initially enabled | Before-state Overview |
| Account disabled | Later Overview plus successful Disable account audit event |
| Initial direct group membership | Security listed in Groups |
| Security group removal | Included in the offboarding workflow; screenshot captures the removal confirmation step |
| Session revocation | Confirmation prompt plus successful timestamp-update audit event |
| Application sessions or existing access tokens terminated | Not tested |
| Licensing, mailbox, devices, data retention, and application access | Outside supplied evidence |

Microsoft's [revoke user access guidance](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access) explains account disablement and revocation, including application session considerations. Successful revocation does not by itself prove that every application session immediately ended.

## Evidence

See the [eleven sanitized screenshots](../../screenshots/04-user-offboarding/README.md). Tenant addresses, object and correlation IDs, administrator identifiers, IP addresses, and user-agent details are masked where present. Fictional employee names, group context, activity names, and statuses remain visible.

## Lessons learned

Offboarding combines account disablement, removal of group-based access, and session revocation. The screenshots tell that workflow through before-state views, confirmation steps, and successful audit events. The group-removal capture shows the confirmation step rather than a refreshed final membership view. Review any service-specific offboarding requirements separately.

## Recovery

If an offboarding action was applied in error, restore account access and necessary group memberships only after an authorized review against the original baseline. Revoked sessions require fresh authentication. No recovery operation is claimed here.
