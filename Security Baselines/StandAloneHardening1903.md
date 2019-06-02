# How to Apply Security Baselines to Non-Domain Joined machines running Windows 10 Version 1903

1. Download the following two files from the Security compliance toolkit:

   -LGPO.zip
   
   -Windows 10 Version 1903 and Windows Server Version 1903 Security Baseline.zip
   
   Download Link: https://www.microsoft.com/en-us/download/details.aspx?id=55319
   
2. Extract the contents of each zip file. 
 
3. Place the LGPO.exe into the tools directory

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-1.PNG)
  
4. Open Powershell in administrative mode and temporarily set the execution policy of powershell to unrestricted with the following code:

   ```
   Set-ExecutionPolicy Unrestricted
   ```
   
5. Run the following:

   ```
   .\BaselineLocalInstall.ps1 -Win10NonDomainJoined
   ```

     
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-2.PNG)
   
6. At this point the following baselines referenced below will automatically install:
 
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-3.PNG)
   
 
9. Type the following in an administrative command prompt window to put Windows Defender into a sandboxed mode

    ```
    setx /M MP_FORCE_USE_SANDBOX 1
    ```
    The following reference url will explain more about this setting: https://www.microsoft.com/security/blog/2018/10/26/windows-defender-antivirus-can-now-run-in-a-sandbox/
    
 10. Setup Windows Defender Block at first sight: (Enforce the bottom two policies. The rest has been set up for you with the powershell script)
     
     In the Group Policy Management Editor, expand the tree to Windows components > Windows Defender Antivirus > Real-time Protection:
     
     A. Double-click Scan all downloaded files and attachments and ensure the option is set to Enabled. Click OK.
     
     B. Double-click Turn off real-time protection and ensure the option is set to Disabled. Click OK.
     
     Reference URL: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-antivirus/configure-block-at-first-sight-windows-defender-antivirus
    
 
     
 11. Navigate to the following GPO to restrict NTLM authententication to remote servers
 
     Computer Configuration\Windows Settings\Security Settings\Local Policies\Security Options

     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StdAloneSec7.PNG)
     
 12. Go to Control Panel and click on Bitlocker Drive Encryption. Turn on 
     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-4.PNG)
     
 13. Choose your Method for saving your recovery key. (I suggest printing it off using the PDF printer then encrypting with an asymetric key. I'll get to that later in my hardening guide)
 
     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-5.PNG)
     
 14. Choose what drive encryption method to use. If you are testing this in a virtual machine choose used space only. If this is on a physical hard disk I would choose to encrypt the entire drive.
 
     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-6.PNG)
     
 15. You can either choose to run a system check (I'd recommend doing) or proceeding to encrypt the machine. 
 
     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-8.PNG)
     
 16. The machine At this point should encrypt.If you are using the "used space only" method the encryption process should go relatively quick.
 
     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-9.PNG)
     
 17. You will get a notification once the machine is done encrypting.
 
     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAloneHardening1903-10.PNG)
     
 18. Open an elevated command prompt and type the following command:
 
 ```
 manage-bde -status c:
 ```
 
 Please note your machine has been default encrypted with XTS-AES-128. If you require something higher such as XTS-AES-256 you will need to specify it in group policy. 
 
     
