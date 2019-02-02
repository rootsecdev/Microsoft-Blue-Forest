# Deploying Microsoft LAPS in Enterprise Environments

This instruction documentation goes over how to install Microsoft laptops in Enterprise environments. It contains how to extended out the Active Directory Schema, controll access via security groups, and automate deployments to workstations and servers. 

**Do not deploy this to Active Directory Domain Controllers.... I repeat do not deploy this to Active Directory Domain Controllers.**

## Reference Links
 - LAPS Technet Reference: https://technet.microsoft.com/en-us/mt227395.aspx
 - Download Link: https://www.microsoft.com/en-us/download/details.aspx?id=46899
 - Project Vast (Audit Laps) Part 1: https://blogs.technet.microsoft.com/jonsh/2018/10/03/finally-deploy-and-audit-laps-with-project-vast-part-1-of-2/
 - Project Vast (Audit Laps) Part 2: https://blogs.technet.microsoft.com/jonsh/2018/11/06/finally-deploy-and-audit-laps-with-project-vast-part-2-of-2/
 - Bonus Link (Remove NTLMv1 with Project vast): https://blogs.technet.microsoft.com/jonsh/2018/06/27/finally-remove-ntlmv1-with-project-vast/
 
 ## Setting up and preparing your domain for MS LAPS
 
 **The following needs to occur on a administrative workstation with Domain and schema admin access.**

1. First we start by aquiring the Microsoft LAPS install file. I have reference the download link in my reference links section.

2. From our administrative workstation double click on the MSI file you downloaded in the previous step. Make sure to install all modules. They will be needed when you extend your AD Schema and apply group policies for your LAPS configuration.

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS1.jpg)

3. **Important. If you have a change control process please do that before proceeding with this step. This will modify the schema in your active directory domain.** Issue these two commands in the screenshot attached. Make sure you do this in an elevated PowerShell session. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS2.jpg)
   
4. Delegate permissions to your workstations and the Organizational unit you want to deploy it to. 
