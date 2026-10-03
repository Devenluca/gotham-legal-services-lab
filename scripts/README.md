# PowerShell scripts

`Test-UserLifecycle.ps1` is a read-only final-state check for Lab 01. It requires Microsoft Graph Authentication, Users, and Groups modules, plus a Graph session in the intended lab tenant with `User.Read.All` and `GroupMember.Read.All` permissions. Consent requirements depend on tenant policy.

Install the modules separately if needed, connect to the intended lab tenant, then run:

```powershell
Connect-MgGraph -TenantId '<lab-tenant-id>' -Scopes 'User.Read.All','GroupMember.Read.All'
./Test-UserLifecycle.ps1 -UserId '<john-object-id>' -DesignGroupId '<design-object-id>' -MarketingGroupId '<marketing-object-id>' -DepartmentHeadsGroupId '<heads-object-id>'
Disconnect-MgGraph
```

The script performs no tenant writes. It checks department, enabled state, and direct membership in the three supplied groups. It does not validate transitive access, app permissions, licenses, or other users. Graph failures stop the script; any failed criterion raises an error after displaying results. Review object IDs before running.

Validation status: static review only; not executed against a tenant.
