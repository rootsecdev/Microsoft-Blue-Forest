# AZ 500 Study Guide

Notes: This is my study guide I've created for the AZ500 exam. All references are direct to Official Microsoft Documents and not third party documention. This is just a disclaimer that this may or may not help you pass the exam.

[Exam AZ-500: Microsoft Azure Security Technologies](https://docs.microsoft.com/en-us/learn/certifications/exams/az-500?tab=tab-learning-paths)

[Skills Measured guide](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE3VC70)

**Learning Paths in Microsoft Learn (Free):**

[Secure your cloud applications in Azure](https://docs.microsoft.com/en-us/learn/paths/secure-your-cloud-apps/)

[Implement Resource Management Security in Azure](https://docs.microsoft.com/en-us/learn/paths/implement-resource-mgmt-security/)

[Implement Network Security in Azure](https://docs.microsoft.com/en-us/learn/paths/implement-network-security/)

[Implement Virtual Machine Host Security in Azure](https://docs.microsoft.com/en-us/learn/paths/implement-host-security/)

[Manage Identity and Access in Azure Active Directory](https://docs.microsoft.com/en-us/learn/paths/manage-identity-and-access/)

[Manage Security Operations in Azure](https://docs.microsoft.com/en-us/learn/paths/manage-security-operations/)

## Manage identity and access (30-35%)
### Manage Azure Active Directory identities
- configure security for service principals

  Docs: [Use the portal to create an Azure AD application and service principal that can access resources](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)

  Docs: [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals)

- manage Azure AD directory groups
 
  Docs: [Manage app & resource access using groups - Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-manage-groups)

  Docs: [Create a basic group and add members - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal)

- manage Azure AD users

  Docs: [Add or delete users - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory)

  Docs: [Assign or remove licenses - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/license-users-groups)

- manage administrative units

  Docs: [Administrative units in Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/roles/administrative-units)

  Docs: [Add and remove administrative units - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/roles/admin-units-manage)
  
  Docs: [Working with administrative units | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/azure/active-directory/working-with-administrative-units?view=azureadps-2.0)

- configure password writeback

  Docs: [Enable Azure Active Directory password writeback | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-sspr-writeback)

- configure authentication methods including password hash and Pass Through Authentication (PTA), OAuth, and passwordless

  Docs: [Authentication methods and features - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-authentication-methods)

  Docs: [Implement password hash synchronization with Azure AD Connect sync | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-password-hash-synchronization)
  
  Tutorial: [Integrate a single AD forest using password hash sync (PHS)](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/tutorial-password-hash-sync)

  Docs: [Azure AD Connect: Pass-through Authentication | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-pta)
  
  Tutorial [Integrate a single AD forest using pass-through authentication (PTA)](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/tutorial-passthrough-authentication)

  Docs: [Configure an OpenID/OAuth application from the Azure AD app gallery | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/saas-apps/openidoauth-tutorial)

  Docs: [Azure Active Directory passwordless sign-in | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-authentication-passwordless)

- transfer Azure subscriptions between Azure AD tenants

  Docs: [Add an existing Azure subscription to your tenant - Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-how-subscriptions-associated-directory)

  Docs: [Transfer billing ownership of an Azure subscription | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/billing-subscription-transfer)

  Docs: [Transfer Azure subscriptions between subscribers and CSPs | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/transfer-subscriptions-subscribers-csp)
 

### Configure secure access by using Azure AD

-	monitor privileged access for Azure AD Privileged Identity Management (PIM)

    Docs: [What is Privileged Identity Management? - Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure)

    Docs: [Assign Azure AD roles in PIM - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-add-role-to-user)

    Docs: [Deploy Privileged Identity Management (PIM) - Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-deployment-plan)

-	configure Access Reviews

    Docs: [Resource dashboards for access reviews in PIM - Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-overview-dashboards)

    Docs: [Review access to Azure AD roles in PIM - Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-perform-security-review)

    Docs: [Create an access review of Azure AD roles in PIM - Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-start-security-review)

-	configure PIM

    Docs: [Activate my Azure AD roles in PIM - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-activate-role?tabs=new)

- implement Conditional Access policies including Multi-Factor Authentication (MFA)

    Docs: [Configure Azure AD Multi-Factor Authentication - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings)

    Docs: [Manage authentication methods for Azure AD Multi-Factor Authentication - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-userdevicesettings)

    Docs: [Change your two-factor verification method and settings - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/user-help/multi-factor-authentication-end-user-manage-settings)
  
    Tutorial: [Secure user sign-in events with Azure AD Multi-Factor Authentication](https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-azure-mfa?toc=/azure/active-directory/conditional-access/toc.json&bc=/azure/active-directory/conditional-access/breadcrumb/toc.json)
  
    Docs: [What is Conditional Access?](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/overview)

    Docs: [Plan a Conditional Access deployment](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/plan-conditional-access)

-	configure Azure AD identity protection

    Docs: [What is Azure Active Directory Identity Protection? | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection)
  
    Docs: [Configure the MFA registration policy - Azure Active Directory Identity Protection | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-mfa-policy)
 

### Manage application access

-	create App Registration

  Docs: Create an Azure AD app and service principal in the portal - Microsoft identity platform | Microsoft Docs

  Docs: Quickstart: Register an app in the Microsoft identity platform | Microsoft Docs

-	configure App Registration permission scopes

  Docs: Microsoft identity platform scopes, permissions, & consent | Microsoft Docs

-	manage App Registration permission consent

  Docs: Microsoft identity platform scopes, permissions, & consent | Microsoft Docs

-	manage API access to Azure subscriptions and resources

  Docs: Microsoft identity platform authentication flows & app scenarios | Microsoft Docs

  Docs: Assign Azure roles using the REST API - Azure RBAC | Microsoft Docs
 
### Manage access control

-	configure subscription and resource permissions

  Docs: What is Azure role-based access control (Azure RBAC)? | Microsoft Docs

  Docs: Tutorial: Grant a user access to Azure resources using the Azure portal - Azure RBAC | Microsoft Docs
-	configure resource group permissions

  Docs: Manage resource groups - Azure portal - Azure Resource Manager | Microsoft Docs

-	configure custom RBAC roles

  Docs: Azure custom roles - Azure RBAC | Microsoft Docs

-	identify the appropriate role

  Docs: Azure identity & access security best practices | Microsoft Docs

  Docs: List Azure role definitions - Azure RBAC | Microsoft Docs

-	apply principle of least privilege

  Docs: Azure identity & access security best practices | Microsoft Docs

-	interpret permissions
  
  Docs: List Azure role assignments using the Azure portal - Azure RBAC | Microsoft Docs

  Docs: Delegate roles by admin task - Azure Active Directory | Microsoft Docs

-	check access

  Docs: Quickstart - Check access for a user to Azure resources - Azure RBAC | Microsoft Docs
 
## Implement platform protection (15-20%)

### Implement advanced network security

-	secure the connectivity of virtual networks (VPN authentication, Express Route encryption)

  Docs: About Azure VPN Gateway | Microsoft Docs

  Docs: Configure Azure AD authentication for User VPN connection: Virtual WAN | Microsoft Docs

  Docs: Azure ExpressRoute Overview: Connect over a private connection | Microsoft Docs

  Docs: Azure ExpressRoute: About Encryption | Microsoft Docs
•	configure Network Security Groups (NSGs) and Application Security Groups (ASGs)
•	create and configure Azure Firewall
•	implement Azure Firewall Manager
•	configure Azure Front Door service as an Application Gateway
•	configure a Web Application Firewall (WAF) on Azure Application Gateway
•	configure Azure Bastion
•	configure a firewall on a storage account, Azure SQL, Key Vault, or App Service
•	implement Service Endpoints
•	implement DDoS protection
 
### Configure advanced security for compute
•	configure endpoint protection
•	configure and monitor system updates for VMs
•	configure authentication for Azure Container Registry
•	configure security for different types of containers
o	implement vulnerability management
o	configure isolation for AKS
o	configure security for container registry
•	implement Azure Disk Encryption
· configure authentication and security for Azure App Service
o configure SSL/TLS certs
o configure authentication for Azure Kubernetes Service
o configure automatic updates

## Manage security operations (25-30%)

### Monitor security by using Azure Monitor
· create and customize alerts
· monitor security logs by using Azure Monitor
· configure diagnostic logging and log retention
Monitor security by using Azure Security Center
· evaluate vulnerability scans from Azure Security Center
· configure Just in Time VM access by using Azure Security Center
· configure centralized policy management by using Azure Security Center
· configure compliance policies and evaluate for compliance by using Azure Security 
Center
· configure workflow automation by using Azure Security Center
Monitor security by using Azure Sentinel
· create and customize alerts
· configure data sources to Azure Sentinel
· evaluate results from Azure Sentinel
· configure a playbook by using Azure Sentinel
Configure security policies
· configure security settings by using Azure Policy
· configure security settings by using Azure BlueprintSecure data and applications (20-25%)
Configure security for storage
· configure access control for storage accounts
· configure key management for storage accounts
· configure Azure AD authentication for Azure Storage
· configure Azure AD Domain Services authentication for Azure Files
· create and manage Shared Access Signatures (SAS)
o create a shared access policy for a blob or blob container
· configure Storage Service Encryption
· configure Azure Defender for Storage
Configure security for databases
· enable database authentication
· enable database auditing
· configure Azure Defender for SQL
o configure Azure SQL Database Advanced Threat Protection
· implement database encryption
o implement Azure SQL Database Always Encrypted
Configure and manage Key Vault
· manage access to Key Vault
· manage permissions to secrets, certificates, and keys
o configure RBAC usage in Azure Key Vault
· manage certificates
· manage secrets
· configure key rotation
· backup and restore of Key Vault items
· configure Azure Defender for Key Vault
