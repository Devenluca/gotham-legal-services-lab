# Lab 01 — Microsoft Entra ID user lifecycle

**Status:** Walkthrough prepared; tenant execution, results, and screenshots pending.

## Business scenario

Gotham Legal Services needs department-based identity management. Create fictional users and security groups, assign initial memberships, then transfer John Blake from Design to Marketing and add him to Department Heads. Remove his outdated Design membership and verify the final state.

## Prerequisites and scope

- A dedicated Microsoft Entra ID lab tenant and an account with permission to create users and manage ordinary security groups.
- Cloud-only users; Security groups with **Assigned** membership. Department Heads must not be a role-assignable group.
- Replace `example.invalid` in the planning CSV with your verified lab domain before creating users. The CSV is a planning format, not the Entra portal's bulk-import schema.
- This scenario checks department metadata and three direct group memberships. No application permissions are configured by this starter. Group membership alone does not prove effective application access.

## Initial setup

1. Review [user seed data](../../csv/users-template.csv). John Blake begins in Design; the other two users provide fictional department examples.
2. In the Microsoft Entra admin center, open **Entra ID > Users**, create each test user, and set the listed department. Use the tenant's password workflow; never put passwords in this repository.
3. Open **Entra ID > Groups** and create **Design**, **Marketing**, and **Department Heads** as Security groups with Assigned membership. Leave Microsoft Entra role assignment disabled.
4. Assign the memberships in [the membership plan](../../csv/membership-plan.csv). Record object IDs privately for verification.
5. Capture John's initial department and group memberships. He should belong to Design and not to Marketing or Department Heads.

## Transfer John Blake

1. Record the requested transfer and initial state.
2. Edit John's user profile and change **Department** from **Design** to **Marketing**. Changing this property does not automatically change Assigned group memberships.
3. Add John to **Marketing**.
4. Add John to **Department Heads**. This represents business membership; it does not grant an Entra administrative role.
5. Remove John from **Design**. Review any separately configured Design access in your tenant and document it before changing it; do not remove unrelated memberships.
6. Refresh the user and group views and verify the final state below.

## Acceptance criteria

| Check | Expected | Actual |
| --- | --- | --- |
| John's Department | Marketing | Pending |
| Direct member of Design | No | Pending |
| Direct member of Marketing | Yes | Pending |
| Direct member of Department Heads | Yes | Pending |
| User remains enabled | Yes | Pending |
| Other test users' memberships | Unchanged | Pending |

Run [Test-UserLifecycle.ps1](../../scripts/Test-UserLifecycle.ps1) with the exact user and group object IDs. It checks John only; manually compare the other users against your baseline. Record command output privately and publish a redacted excerpt if useful.

## Evidence checklist

Store reviewed images in [screenshots/01-user-lifecycle](../../screenshots/01-user-lifecycle/README.md).

- [ ] `01-users-created.png` — fictional user list
- [ ] `02-groups-created.png` — group names and types
- [ ] `03-john-before.png` — Design department and initial membership
- [ ] `04-john-after.png` — Marketing department
- [ ] `05-final-memberships.png` — Marketing and Department Heads; no Design
- [ ] `06-verification.png` — verification results

Add image links after the files exist. Do not mark this lab complete until all acceptance criteria are checked and evidence is reviewed.

## Troubleshooting notes

Record actual issues here. Useful checks include an incorrect tenant, a duplicate display name, Assigned versus dynamic membership, stale portal views, and insufficient permissions. Use object IDs to avoid changing the wrong identity.

## Rollback

For this fictional transfer, restore John's Department to Design, restore Design membership, and remove the Marketing and Department Heads memberships added during the scenario. Check against the recorded baseline. Record any separately configured access restored and verify the result.

## Results and lessons learned

Pending execution. Add the execution date, actual outcomes, evidence, and observations here.
