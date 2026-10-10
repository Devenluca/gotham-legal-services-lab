# Lab 02 — Bulk user creation and CSV troubleshooting

**Status:** Failed attempts and subsequent user creation documented with sanitized evidence.

## Scenario

Add a batch of fictional employees to Gotham Legal Services through Microsoft Entra ID bulk user creation. Prepare the CSV, investigate failed imports, and review the resulting accounts.

## What happened

1. The initial Users view showed **7 users**.
2. Four Create Users entries in the Bulk Operations view showed **Failed** on October 3, 2026.
3. The operator reported that the CSV did not separate correctly into columns. The failed-job screenshot confirms failures, but does not expose a detailed error report proving that cause.
4. The supplied local CSV files now contain 17 columns and 10 user records. That describes the available files, not necessarily the exact bytes used in each failed attempt. No original CSV is published because the files contain a password column and tenant identifiers.
5. Later Users screenshots show **17 users**, a net increase of 10. A Damian Wayne profile provides an example of a created account, including an enabled state and populated properties.

## Troubleshooting and lessons

Check delimiter handling in the editor and inspect the saved CSV as text. Download the current portal template, retain its required structure, and validate required fields before retrying. Review individual operation results to identify failed rows and avoid duplicate retries. Microsoft documents the required template and bulk workflow in [Bulk create users](https://learn.microsoft.com/en-us/entra/identity/users/users-bulk-add).

A list count and one example profile provide useful evidence of progress. They do not prove that every requested property on every imported user is correct. A complete row-by-row comparison and the final job result remain follow-up checks.

## Results

| Check | Observed result |
| --- | --- |
| Initial user count | 7 |
| Failed bulk operations | Four failed Create Users entries |
| Later user count | 17 |
| Example created account | Damian Wayne, enabled |
| Detailed failure report | Not supplied |
| Final successful job report | Not supplied |
| Every imported user's properties | Not independently verified |

## Evidence

See the [six sanitized screenshots](../../screenshots/02-bulk-user-creation/README.md), showing the baseline, failures, later user lists, and example account.

## Recovery

Before removing any accidentally imported account, compare it to the original batch and review its dependencies. No cleanup or rollback execution is claimed by this lab.
