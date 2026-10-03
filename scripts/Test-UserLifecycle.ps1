#Requires -Modules Microsoft.Graph.Authentication, Microsoft.Graph.Users, Microsoft.Graph.Groups
[CmdletBinding()]
param(
    [Parameter(Mandatory)][guid]$UserId,
    [Parameter(Mandatory)][guid]$DesignGroupId,
    [Parameter(Mandatory)][guid]$MarketingGroupId,
    [Parameter(Mandatory)][guid]$DepartmentHeadsGroupId
)

$ErrorActionPreference = 'Stop'
if (-not (Get-MgContext)) {
    throw 'Connect to the intended lab tenant with Connect-MgGraph first.'
}
if (@(@($DesignGroupId, $MarketingGroupId, $DepartmentHeadsGroupId) | Select-Object -Unique).Count -ne 3) {
    throw 'Provide three distinct group object IDs.'
}

$user = Get-MgUser -UserId $UserId.ToString() -Property Id,DisplayName,Department,AccountEnabled
$checks = @(
    [pscustomobject]@{ Check = 'Department'; Expected = 'Marketing'; Actual = $user.Department; Passed = ($user.Department -eq 'Marketing') }
    [pscustomobject]@{ Check = 'Account enabled'; Expected = $true; Actual = $user.AccountEnabled; Passed = ($user.AccountEnabled -eq $true) }
)
$groupChecks = @(
    @{ Name = 'Design'; Id = $DesignGroupId; Expected = $false }
    @{ Name = 'Marketing'; Id = $MarketingGroupId; Expected = $true }
    @{ Name = 'Department Heads'; Id = $DepartmentHeadsGroupId; Expected = $true }
)
foreach ($groupCheck in $groupChecks) {
    $members = @(Get-MgGroupMember -GroupId $groupCheck.Id.ToString() -All)
    $isMember = @($members | Where-Object { $_.Id -eq $user.Id }).Count -gt 0
    $checks += [pscustomobject]@{
        Check = "Direct membership: $($groupCheck.Name)"
        Expected = $groupCheck.Expected
        Actual = $isMember
        Passed = ($isMember -eq $groupCheck.Expected)
    }
}
$checks
if (@($checks | Where-Object { -not $_.Passed }).Count -gt 0) {
    throw 'User lifecycle verification failed. Review the reported criteria.'
}
