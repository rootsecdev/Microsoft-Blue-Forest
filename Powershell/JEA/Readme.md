# Just Enough Administration

This section focuses on Just Enough Administration to limit administration rights on Windows Server 2012 R2 and above. Doucmentation is currently incomplete but should be done in the next day or so (3.19.20 Time of edit)

## Preqrequisites

Powershell Version 5.1

https://www.microsoft.com/en-us/download/details.aspx?id=54616

Notes: At this time I have not tested JEA functionality with Powershell 7. I will probably get to that at some point. In the instructions below you can do on a Windows 10 Client machine. The purpose is to setup a powershell module first then deploy the JEA configuration to a target endpoint.

## Instructions

1. Open up Powershell ISE as Administrator

2. In your PowerShell Window please make sure you are operating at the root of c:\

3. In the ISE code windows copy the following powershell code:

```
# Create a JEA Directory and module setup

New-Item -Path JEA -ItemType Directory

New-Item -Path .\JEA\JEA.psm1

New-ModuleManifest -Path .\JEA\JEA.psd1 -RootModule JEA.psm1

New-Item -Path .\JEA\RoleCapabilities -ItemType Directory

New-PSRoleCapabilityFile -Path .\JEA\RoleCapabilities\JEARole.psrc

New-PSSessionConfigurationFile -SessionType RestrictedRemoteServer -Path .\JEA\JEA.pssc

# Only do test configuration file when done with JEA config

Test-PSSessionConfigurationFile -Path .\JEA\JEA.pssc
```

4. Edit the "pssc" file or in this case C:\JEA\JEA.pssc. We will create a Role Definition defined with a security group and will reference the RoleCapabilities file "JEARole". In this example I've created a JEA_IIS security group. It's purpose will give a normal user with no administrative rights the ability to restart IIS services. 

```
RoleDefinitions = @{ 'LAB\JEA_IIS' = @{ RoleCapabilities = 'JEARoles' }; }
```

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Powershell/JEA/Screenshots/JEA1.PNG)

5. Next make sure you uncomment the line "Whether to run this session configuration as the machine's (virtual) administrator account"

Before:

```
#RunAsVirtualAccount = $true
```

After:

```
RunAsVirtualAccount = $true
```

## Resources

Just Enough Administration Overview

https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/jea/overview?view=powershell-7

Just Enough Administration Techsnip

https://www.youtube.com/watch?v=hblqUUOykeo
