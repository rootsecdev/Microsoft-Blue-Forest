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

New-PSRoleCapabilityFile -Path .\JEA\RoleCapabilities\JEARoles.psrc

New-PSSessionConfigurationFile -SessionType RestrictedRemoteServer -Path .\JEA\JEA.pssc

# Only do test configuration file when done with JEA config

Test-PSSessionConfigurationFile -Path .\JEA\JEA.pssc
```

4. Edit the "pssc" file or in this case C:\JEA\JEA.pssc. We will create a Role Definition defined with a security group and will reference the RoleCapabilities file "JEARole". In this example I've created a JEA_IIS security group. It's purpose will give a normal user with no administrative rights the ability to restart IIS services. 

```
RoleDefinitions = @{ 'LAB\JEA_IIS' = @{ RoleCapabilities = 'JEARoles' }; }
```

When you get done editing this is how it should look.

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

6. Next edit the JEARole.psrc file. We will edit this file with commandlets that people in our security group will be allowed to run. In the Visible Commandlets section we will add the following. This will give members that ability to specifically restart IIS services and run certain get commands to check service statuses and inventory start up modes on services. I'll explain later in subsequent steps. 

```
VisibleCmdlets = @{ Name = 'Restart-Service'; Parameters = @{ Name = 'Name'; ValidateSet = 'W3SVC' }},
                 'Get-Service',
                 'Get-CimInstance',
                 'Format-Table'
```

7. This step involves setting up the JEA enpoint. You can do this a few different ways. Copy the JEA folder directly to "C:\Program Files\WindowsPowerShell\Modules" or do it remotely through a Remote PS Session. This code will show how to do through a remote PS Session. This assumes the target server is named "2012VM1"

```
# Open a session to server

$session = New PSSession 2012VM1

# Copy the modules to the folder on the remote server. In your powershell session make sure you are operating out of the folder where the JEA module is located

Copy-Item -Path .\JEA -Destination 'C:\Program Files\WindowsPowerShell\Modules' -Recurse -ToSession $session -Force

# Copy the Session Configuration file to the C:\ drive on the remote server

Copy-Item -Path .\JEA.pssc -Destination c:\ -ToSession $session -Force

# Register the new PowerShell endpoint on the remote server using the session configuration file

Invoke-Command -Session $session -ScriptBlock {Register-PSSessionConfiguration -Path C:\JEA.pssc -Name 'JEA' -Force}

# Register the new Powershell endpoint locally if you don't want to do over a remote session

Invoke-Command -ScriptBlock {Register-PSSessionConfiguration -Path C:\JEA.pssc -Name 'JEA' -Force}

# Verify Session Configuration 
Get-PSSessionConfiguration

```
Here is an example of what you should see when you invoke the JEA configuration:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Powershell/JEA/Screenshots/JEA2.PNG)

Here is an example of what you should see when you check on the PS Session Configuration:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Powershell/JEA/Screenshots/JEA4.PNG)

8. Check the PS Session Cofiguration security descriptor by doing the following:

```
Set-PSSessionConfiguration JEA -ShowSecurityDescriptorUI
```

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Powershell/JEA/Screenshots/JEA3.PNG)

You should have Full Control of all operations with the role profile.

9. At this point you should be able to enter a PowerShell Remote session as a non-administrator and perform one of the commands you allowed in your PSRC role file from Step 6:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Powershell/JEA/Screenshots/JEA5.PNG)

10. If you try and restart a service you have not defined in the role file or not allowed you will get the following error because you aren't allowed access to restart the service: 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Powershell/JEA/Screenshots/JEA6.PNG)

## Resources

Just Enough Administration Overview

https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/jea/overview?view=powershell-7

Just Enough Administration Techsnip

https://www.youtube.com/watch?v=hblqUUOykeo
