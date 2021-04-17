# MFA Setup and Deployment

**Pre-Requisites**

1. Find All Licensed users for Office 365/M365

URL Reference: https://docs.microsoft.com/en-us/microsoft-365/enterprise/view-licensed-and-unlicensed-users-with-microsoft-365-powershell?view=o365-worldwide

Powershell Code for finding all licensed users:

```
Get-AzureAdUser | ForEach { $licensed=$False ; For ($i=0; $i -le ($_.AssignedLicenses | Measure).Count ; $i++) { If( [string]::IsNullOrEmpty(  $_.AssignedLicenses[$i].SkuId ) -ne $True) { $licensed=$true } } ; If( $licensed -eq $true) { Write-Host $_.UserPrincipalName} }
```

or:

```
Get-MsolUser -All | where {$_.isLicensed -eq $true}
```

2. Setup conditional access for Security Security Information Registration:

URL Reference: https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/howto-conditional-access-policy-registration

URL Reference: https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-registration-mfa-sspr-combined

In Azure Active Directory:

User Settings > Manage User Preview Settings
