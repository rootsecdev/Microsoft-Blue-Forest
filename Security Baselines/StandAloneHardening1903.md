# How to Apply Security Baselines to Non-Domain Joined machines running Windows 10 Version 1903 (Experimental. Testing Changes)

1. Download Windows 10 Custom Zip:

   https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Security%20Baselines/Win10%20Custom.zip
   
2. Extract the contents of the zip file. 
 

3. Open Powershell in administrative mode and temporarily set the execution policy of powershell to unrestricted with the following code:

   ```
   Set-ExecutionPolicy Unrestricted
   ```
   
4. Run the following:

   ```
   .\BaselineLocalInstall.ps1 -Win10NonDomainJoined
   ```

     
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-2.PNG)
   
6. At this point the following baselines referenced below will automatically install:
 
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-3.PNG)
   
7. Set execution policy back to restricted mode
  
   ```
   Set-ExecutionPolicy Restricted
   ```
   
 
9. Type the following in an administrative command prompt window to put Windows Defender into a sandboxed mode

    ```
    setx /M MP_FORCE_USE_SANDBOX 1
    ```
    The following reference url will explain more about this setting: https://www.microsoft.com/security/blog/2018/10/26/windows-defender-antivirus-can-now-run-in-a-sandbox/
    
 ## About Windows 10 Custom Zip File
 
 This is a customized version of Microsoft Security Compliance toolkit. It contains the following changes.You do not need to manually make these changes as they have already been done when you executed the powershell script from Step 4. 
 
Adds Windows Defender Block at first sight: (Enforce the bottom policies. The rest has been set up for you with the powershell script). To get to the local group policy editor type in gpedit.msc in the search bar, command prompt, or run box.
 
     In the Group Policy Management Editor, expand the tree to Windows Components > Windows Defender Antivirus > MAPS
     
     A. Double-click Join Microsoft MAPS and set to enabled with Advanded MAPS. Click ok.
     
     B. Double-click Block at first site and set to enabled. Click ok. 
     
     In the Group Policy Management Editor, expand the tree to Windows components > Windows Defender Antivirus > Real-time Protection:
     
     A. Double-click Scan all downloaded files and attachments and ensure the option is set to Enabled. Click OK.
     
     B. Double-click Turn off real-time protection and ensure the option is set to Disabled. Click OK.
     
     Reference URL: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-antivirus/configure-block-at-first-sight-windows-defender-antivirus
    
Bitlocker Encryption Policy changes. Mandates the use of XTS-AES-256 for encryption of the operating system drive. Mandates CBC-AES-256 for removable media encryption. OS encryption type is used space only. Removable media encryption type is full disk encryption. 
     

 
