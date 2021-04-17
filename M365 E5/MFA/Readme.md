# MFA Setup and Deployment

**Find All Licensed users for Office 365/M365**

URL Reference: https://docs.microsoft.com/en-us/microsoft-365/enterprise/view-licensed-and-unlicensed-users-with-microsoft-365-powershell?view=o365-worldwide

Powershell Code for finding all licensed users:

```
Get-AzureAdUser | ForEach { $licensed=$False ; For ($i=0; $i -le ($_.AssignedLicenses | Measure).Count ; $i++) { If( [string]::IsNullOrEmpty(  $_.AssignedLicenses[$i].SkuId ) -ne $True) { $licensed=$true } } ; If( $licensed -eq $true) { Write-Host $_.UserPrincipalName} }
```

or:

```
Get-MsolUser -All | where {$_.isLicensed -eq $true}
```

2. Setup conditional access for Secure Security Information Registration:

URL Reference: https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/howto-conditional-access-policy-registration

URL Reference: https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-registration-mfa-sspr-combined

**Enable Combined Information registration experience for all users**

In Azure Active Directory:

User Settings > Manage User Preview Settings

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA1.PNG)

**Configure MFA Trusted IPs**

In Azure Active Directory:

Security > Named Locations > Configure MFA Trusted IP's

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA2.PNG)

Configure your Organization's external IP ranges and disallow text messages and calls to phones as options to MFA. (This is done primarily due to SIM jacking on cellular phones)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA3.PNG)

**Configure Trusted Locations for Security Registration**

Note: This is how I started doing trusted locations. More than likely if you are deploying MFA for the first time you don't have things like hybrid azure ad join setup yet. This is an easy way to require MFA registration with trusted locations such as MFA trusterd IP's. Please take notes I am excluding global admins from this policy. This is done on purpose as it is a good practice to exclude certain accounts in case you have a loss of access to IP ranges's. The conditions below will block people from accessing security information on anything else other than trusted IP's. 

In Azure Active Directory: 

Security > Conditional Access

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA4.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA5.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA6.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA7.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA8.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA9.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/MFA/Screenshots/MFA10.PNG)

**Inform your users about MFA rollouts**

Tips

- Do not roll out your entire organization at once. This will drive up help desk calls. I found it is best to roll out in Alphabetical order. 
- Use MFA list that you generated earlier in this documentation
- Use the following URL in your communication https://mysighnins.microsoft.com/security-info



