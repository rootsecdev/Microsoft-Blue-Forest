# How to make fake Honey Pot Accounts in Active directory

## Manual Methods

1. In the example below use the "runas" command with /netonly option. The program will execute on the local computer as the user you are currently logged as but any connections to other computers on the network will be made using the account specified. The point of this is to inject a fake account with fake creds into lsass memory and wait for redteam enumeration and exploitation.

     ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Honeypots/Screenshots/HoneyTokens1.JPG)

2. Keep in my the target account in step 1. Does not exist in active directory as shown below:

    ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Honeypots/Screenshots/HoneyTokens2.JPG)
    
3. From an attackers viewpoint inside a meterpreter session. What I should have done on step one was captitalize my seclab domain but this should demonstrate the point below:

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Honeypots/Screenshots/HoneyTokens3.JPG)
   
4. From an event logging perspective when a meterpreter session is achieved we should be scrutinizing events 4624 in the security log. Especially when Null sessions show up on Impersonation. 
 
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Honeypots/Screenshots/HoneyTokens4.JPG)
  
5. Next attacker attempts to pass the hash using a psexec using our fake AD credentials

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Honeypots/Screenshots/HoneyTokens5.JPG)
  
6. Here is what to look for in event logging to detect PtH activity on the fake account.

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Honeypots/Screenshots/HoneyTokens6.JPG)
   
## How to automate spreading of fake or honey hashed based creds in Active Directory

**Prerequisites:**

All powershell code in this documentation should be signed with a trusted code signing certificate. Powershell scripts should never be allowed to run in "Unrestricted Mode". A safer method is to make sure your powershell execution policy is set to remote signed. 

To verify your powershell exection policy launch powershell and type in the following command:

```
Get-ExecutionPolicy
```

If your execution policy is set to restricted you can change by doing the following in a elevated Powershellshell prompt with administrator access:

```
Set-ExecutionPolicy RemoteSigned
```

Once you acquire a code signing certificate through active directory certificate services or by some other means. Time Stamping your code is important as you may sign many scripts with powershell code signing. Powershell code that is signed will continue to run even if the certificate expires. This is an example of how you sign PowerShell code with a time stamp authority:

```
$cert=(dir cert:currentuser\my\ -CodeSigningCert)

Set-AuthenticodeSignature .\powershell.ps1 $cert -TimeStampServer http://tsa.starfieldtech.com
```

The public Key of your code signing certificate requires to be in the trusted publisher section to all computers in Active Directory. If the public key is not a trusted publisher your scripts will fail to run. The screenshot below gives the group policy location of the trusted publishers section. I recommend attaching the CA policy to the root of your domain to minimize your chances of script failure:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Honeypots/Screenshots/CertificateAuthority.PNG)


**1. Honey Pot Batch Script**

This script with automate the deployment of honey hashed based credentials into lsass memory. In the age of COVID-19 and work from home this covers the scenario of injecting the honeypot account into lsass memory even if the the machine is a offline state not connected to the active directory domain. This ensures that the honeypot accounts remains active in memory until a shutdown or reboot. This script also creates a scheduled task that runs at user logon to facilitate the re-injection of fake credentials into memory. This needs to be deployed out via SCCM or some type of software distribution method since it requires administrative access.

```
REM Create honey hash powershell module if it doesn't exist
IF NOT EXIST "C:\Program Files\WindowsPowerShell\Modules\New-HoneyHash" GOTO Install
IF EXIST "C:\Program Files\WindowsPowerShell\Modules\New-HoneyHash" GOTO Execute

:Install
mkdir "C:\Program Files\WindowsPowerShell\Modules\New-HoneyHash"
copy \\Your Domain\NETLOGON\Honey-Hash\New-HoneyHash.psm1 "C:\Program Files\WindowsPowerShell\Modules\New-HoneyHash"
copy \\Your Domain\NETLOGON\Honey-Hash\CreateHoneyHash.ps1 "C:\Program Files\WindowsPowerShell\Modules\New-HoneyHash"
powershell.exe Import-Module New-HoneyHash

:Execute
SchTasks /Create /SC ONLOGON /TN "HoneyHash User Scheduled Task" /TR "\"powershell.exe\" -windowstyle hidden -NoExit -File 'C:\Program Files\WindowsPowerShell\Modules\New-HoneyHash\CreateHoneyHash.ps1'
```

**2. New-Honeyhash.psm1**

I can take no credit for this as this was copied from the Emipire project. (https://github.com/EmpireProject/Empire/blob/master/data/module_source/management/New-HoneyHash.ps1). You can download my file or head over to the Empire Project and download it from there. Its very important that this file gets saved as a psm1 file and not a ps1 file. This needs to act as a powershell function so you can invoke New-Honeyhash correctly from powershell without having to call more scripts. 

**3. CreateHoneyHash.ps1**

This script was taken from a stealth bits article that was written some time ago. I slightly modified mine so I would have a static account but a randomly generated password. You can mix and match this script with whatever you like. The article goes into detail on how to make random service accounts which would be useful for server based OS's. 

(https://blog.stealthbits.com/deploying-pass-the-hash-honeypots/)
