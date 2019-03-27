# How to Apply Security Baselines to Non-Domain Joined machines

1. Download the following two files from the Security compliance toolkit:

   -LGPO.zip
   
   -Windows 10 Version 1809 and Windows Server 2019 Security Baseline.zip
   
   Download Link: https://www.microsoft.com/en-us/download/details.aspx?id=55319
   
2. Extract the contents of each zip file. 
 
3. Place the LGPO.exe into the tools directory

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StdAloneSec1.PNG)
  
4. Open Powershell in administrative mode and temporarily set the execution policy of powershell to unrestricted with the following code:

   ```
   Set-ExecutionPolicy Unrestricted
   ```
   
5. Run the following:

   ```
   .\BaselineLocalInstall.ps1 -Win10NonDomainJoined
   ```

   Type r to run once on execution of the script
  
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StdAloneSec2.PNG)
   
6. At this point the following baselines referenced below will automatically install:
 
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StdAloneSec3.PNG)
   
7. Next copy the EP.XML from the config files directory to a new directory on the C:\ drive. In this example I created a directory called C:\ExploitProtection

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StdAloneSec4.PNG)
   
8. Navigate to the following group policy object:
  
   Computer Configuration\Administrative Templates\Windows Components\Windows Defender Exploit Guard\Exploit Protection
   
   Open the following GPO setting and put the following patch of your EP.XML file as shown below. This will configure Windows Defender Exploit Guard (Formerly EMET)
   
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StdAloneSec5.PNG)
   
 9. Type the following in an administrative command prompt window to put Windows Defender into a sandboxed mode

    ```
    setx /M MP_FORCE_USE_SANDBOX 1
    ```
    The following reference url will explain more about this setting: https://www.microsoft.com/security/blog/2018/10/26/windows-defender-antivirus-can-now-run-in-a-sandbox/
