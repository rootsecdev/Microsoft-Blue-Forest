# Reviewing OATH Permissions in Azure AD

Powershell code to review OATH authorized applications in Azure Active Directory

```
Get-AzureADServicePrincipal -Filter "serviceprincipaltype eq 'Application'" -All $true -PipelineVariable sp | Get-AzureADServicePrincipalOAuth2PermissionGrant -top 1 | select @{N="SPDisplayname";E={$sp.displayname}}, @{N="SPObjectid";E={$sp.objectid}}, consenttype, scope
```

Look for scopes that allow application to all users or profiles and has the ability to write.  Use the following to remove:

```
Remove-AzureADOAuth2PermissionGrant -objectid <spobjectid>
```

Legend on permissions:

Read hidden memberships [Member.Read.Hidden]

Read all users’ full profiles [User.Read.All]

Read all groups [Group.Read.All]

Write all groups [Group.Write.All]

Read and write all directory data [Directory.ReadWrite.All]

Read all directory data [Directory.Read.All]

Read and update your organization's security actions [SecurityActions.ReadWrite.All]

Read and update your organization’s security events [SecurityEvents.ReadWrite.All]

Read and write privileged access to Azure AD [PrivilegedAccess.ReadWrite.AzureAD]

Read and write privileged access to Azure resources [PrivilegedAccess.ReadWrite.AzureResources]

Read and write your organization's conditional access policies [Policy.ReadWrite.ConditionalAccess]

Read and write risk event information [IdentityRiskEvent.ReadWrite.All]

Read and write identity providers [IdentityProvider.ReadWrite.All]

## Permanent mitigation: Configure the admin consent workflow (preview)

https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/configure-admin-consent-workflow
