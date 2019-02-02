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

3. **Important. If you have a change control process please do that before proceeding with this step. This will modify the schema in your active directory domain.** Issue these two commands in the screenshot attached. Make sure you do this in an elevated PowerShell session. This will extend you schema with the laps attributes in AD. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS2.jpg)
   
4. Delegate permissions to your workstations/servers and the Organizational unit you want to deploy it to.In this example I am deploying the permissions to the root of my AD container where all my workstations sit. Sub OU's in this container will automatically inherit these permissions. This allows the workstation to update the laps attibute with its new password information. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS3.jpg)

   - Just a side note that the attirbutes published in step 3 and the computer's ability to update the attributes is a hidden field. Normal end users that have RSAT install will not be able to see them unless you delegate permissions. I'll get to how to do that in the next few steps. 
   
5. Next we should find extended rights holders in the OU's you deploy laps to. In this example I am looking at the workstations OU. This is a good audit check to make sure you haven't over delegated permissions to your OU's. By default in a fresh forest this is all you should see is system and domain admins. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS4.jpg)
   
 6. Before proceeding with this step you need to create some security groups. I only created one security group to both read and reset laps passwords. I called it "LAPSWorkstationReset". You can get granular and separate Read and Write out between two security groups if you wish.
    
    ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS5.jpg)
   
7. Create a LAPS Group policy object. You can set how long you want the admin password to be. In this example I set mine to 24 characters that rotate every 30 days. You can also set what you want your complexity to be. Attach this policy to the OU's you delegate permissions to in step 4. 
   
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS6.jpg)
   
8. The last step is to create a software installation policy. The LAPS MSI is extremely small. While you could deploy the LAPS MSI into your workstation/server images I prefer the installation policy method. It provides you a way to enforce LAPS to be installed on workstations and member servers. Plus its so easy to audit. I usually attach my software installation policy for LAPS along with my LAPS GPO that I created from Step 7. Notice in this example I am pointing it to a specific DC. Since my lab only has one DC I got specific however you can deploy it from \\somedomain.com\NETLOGON\LAPSx64.msi

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/LAPS7.jpg)
