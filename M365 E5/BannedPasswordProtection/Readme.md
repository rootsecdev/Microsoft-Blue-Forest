# Azure AD Banned Password Protection

**URL References:**

Enforce on-premises Azure AD Password Protection for Active Directory Domain Services

https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-password-ban-bad-on-premises

Plan and deploy on-premises Azure Active Directory Password Protection

https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-password-ban-bad-on-premises-deploy

Enable on-premises Azure Active Directory Password Protection

https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-password-ban-bad-on-premises-operations

Downloads: Azure AD Password Protection for Windows Server Active Directory

https://www.microsoft.com/en-us/download/details.aspx?id=57071

## Architecture overview

Recommended configuration is two Azure AD proxy servers for dual redundancy and loading the DC agent on all domain controllers.

Software Pre-Requisites:

- All machines where the Azure AD Password Protection proxy service will be installed must have .NET 4.7.2 installed
- All machines that host the Azure AD Password Protection proxy service must be configured to grant domain controllers the ability to log on to the proxy service. This ability is controlled via the "Access this computer from the network" privilege assignment.
- All machines that host the Azure AD Password Protection proxy service must be configured to allow outbound TLS 1.2 HTTP traffic.
- A Global Administrator or Security Administrator account to register the Azure AD Password Protection proxy service and forest with Azure AD.
- Network access must be enabled for the set of ports and URLs specified in the [Application Proxy environment setup procedures.](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/application-proxy-add-on-premises-application#prepare-your-on-premises-environment)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/M365%20E5/BannedPasswordProtection/Screenshots/BanPwd1.PNG)

