## PowerShell Restriction Scripts ##

This repository contains PowerShell scripts that:

- **Restrict Azure AD PowerShell access to a single user**

- **Restrict Microsoft Graph PowerShell access to a single user**

- **Restore default access (rollback)**

These scripts use **Microsoft Graph REST API** via the **Az PowerShell module**.

### What This Controls ###

These scripts target the Azure AD and MS Graph PowerShell enterprise application:

| Property |	Value |
| -------- | ------ |
| Display Name |	Azure Active Directory PowerShell |
| App ID |	1b730954-1685-4b74-9bfd-dac224a7b894 |

| Property |	Value |
| -------- | ------ |
| Display Name |	MS Graph PowerShell |
| App ID |	14d82eec-204b-4c2f-b7e8-296a70dab67e |

When restriction is enabled:
- appRoleAssignmentRequired = true
- All existing assignments are removed
- Only the signed-in user running the script is assigned access

This effectively blocks the PowerShell application ID's and authentication for all other users.

---

### Prerequisites ###
1. **Required Module**

Install the Az module if not already installed:
```
Install-Module Az -Scope CurrentUser
```


2. **Required Permissions**

You must be one of the following:

- Global Administrator

- Application Administrator

- Cloud Application Administrator



3. **Authenticate**

Before running either script:

```
Connect-AzAccount
```

---

### Restrict Script Usage ###

**What It Does**

- Creates the service principal if it does not exist

- Enables **Assignment Required**

- Removes existing app role assignments

- Assigns only the current signed-in user

Run It:

```
.\Block-AzureAD-PowerShell.ps1
```

Expected Output

You should see:
```
[+] Getting Microsoft Graph access token...
[+] Getting current signed-in user...
[+] Found existing service principal...
[+] Enabling 'Assignment Required'...
[+] Assigning current user access...
Azure AD PowerShell is now blocked for everyone except you.
```

---

### Rollback Script Usage ###
**What It Does**

- Disables **Assignment Required**

- Removes all explicit app role assignments

- Restores tenant default behavior

Run It:
```
.\Rollback-AzureAD-PowerShell.ps1
```

Expected Output:
```
[+] Disabling 'Assignment Required'...
[+] Removing all app role assignments...
Azure AD PowerShell access has been restored to tenant defaults.
```

---

### Important Notes ###
**This Script Blocks:**

- AzureAD PowerShell module

- MSOnline PowerShell module

- Microsoft Graph PowerShell Module

---

### Safety Recommendations ###

- Always test in a non-production tenant first

- Maintain a break-glass Global Admin account

- Verify access before signing out

- Keep rollback script available locally

---

### License ###

Use at your own risk. Test thoroughly before production use.
