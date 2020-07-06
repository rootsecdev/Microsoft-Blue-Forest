# Installing OpenSSH on Windows Server 2016

1. Download the latest OpenSSH release from Microsoft’s Powershell Gallery on github. 
   
   https://github.com/PowerShell/Win32-OpenSSH/releases

2. Install OpenSSH with the following command:

```
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1
```

3. Set Firewall rule on server:

```
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

4. Start firewall service:

```
net start sshd
```

5. Make startup type for sshd service to automatic

```
Set-Service sshd -StartupType Automatic
```

Here is the above commands and outputs in action:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Open-SSH/Screenshots/OpenSSH-1.PNG)

## Post SSH install

Enabling SSH with password authentication (not recommended)

1. Stop sshd service and modify the sshd_config file in C:\Program Files\OpenSSH

2. Allow Password Authentication by uncommenting the line below:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Open-SSH/Screenshots/OpenSSH-2.PNG)

Only allow access via Active Directory Security Group. In this example access is limited to Active Directory users that are apart of lab\sshusers group. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Open-SSH/Screenshots/OpenSSH-3.PNG)

3.	Modify the ssh firewall rule for remote connections to only accept traffic over SFTP via Port 22 to subnets that need access an example is below:

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Open-SSH/Screenshots/OpenSSH-4.PNG)
