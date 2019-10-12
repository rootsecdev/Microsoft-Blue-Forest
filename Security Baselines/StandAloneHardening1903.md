# How to Apply Security Baselines to Non-Domain Joined machines running Windows 10 Version 1903 

1. Download Windows 10 Version 1903 and Windows Server Version 1903 Security Baseline.zip:

   https://www.microsoft.com/en-us/download/details.aspx?id=55319
   
2. Extract the contents of the zip file. 
 

3. Open Powershell in administrative mode and temporarily set the execution policy of powershell to unrestricted with the following code:

   ```
   Set-ExecutionPolicy Unrestricted
   ```
   
4. Run the following from the Local_Script folder from the zip file you extracted from Step 2:

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
    
10. Remove PowerShell 2.0 from administrative command prompt window:

```
Dism /online /Disable-Feature /FeatureName:"MicrosoftWindowsPowerShellV2Root"
```

## Bitlocker Security

By default bitlocker is configured with XTS-AES-128 encryption and preboot authentication is left off by default. Its highly recommended that you turn on preboot authentication. Preboot authentication is explained in the following document for bitlocker countermeasures:

https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-countermeasures

Preboot authentication can be turned on in the following location for your operating system.

Computer Configuration\Administrative Templates\Windows Components\Bitlocker Drive Encryption\Operating System Drives\Require Additional Authentication at startup

If your host machine has a TPM chip set the following options:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAlone1903-1.PNG)

If your host machine does not have a TPM chip set the following options:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAlone1903-2.PNG)

(Optional) Configure OS encryption to XTS-AES-256

The option to use AES256 over AES128 is optional. Both provide an adequate layer data encryption protection of hard disks when the device is powered off. However, if you are in the goverment sector or in a federally regulated environment you should be using an AES256 suite to protect data. Further guidance can be found at:

https://apps.nsa.gov/iaarchive/programs/iad-initiatives/cnsa-suite.cfm

Encryption options can be set at the following location:

Computer Configuration\Administrative Templates\Windows Components\Bitlocker Drive Encryption

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StandAlone1903-4.PNG)

At this point right click on your C (OS Drive) and turn on bitlocker


 ## Windows 10 References and Post hardening checklist

Ensure Windows 10 Block at First sight is turned on
    
Reference URL: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-antivirus/configure-block-at-first-sight-windows-defender-antivirus
    
 
     

 
