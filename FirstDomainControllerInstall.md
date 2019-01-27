# Welcome to building your first domain controller!
Here you will find documentation on building your first domain controller and forest that is centered around blue team operational security. This is a living Wiki that will be added to over time. 

## Building a domain controller with Hyper-V
First start by creating a New Virtual machine and click on next.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper1.PNG)

Choose a name and place to store your virtual machine. you can name it anything you like. For best performance put the virtual machine on a separate disk from your operating system. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper2.PNG)

Select Generation 2 for the virtual machine type. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper3.PNG)

Assign a minimum of 4096 gig of ram.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper4.PNG)

For now choose to not connect the new VM to a network. (This is very important if you are making a 2016 server! Standing up a 2016 server unpatched is extremely dangerous as it is not patched with MS17-10. MS17-10 can easily be exploited remotely with no credentials needed to drop into a shell as system on a domain controller)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper5.PNG)

Choose the defaults for the creation of a hard disk.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper6.PNG)

Select your ISO image file. If you need a server iso you can download either server 2016 or server 2019 at the following address:

Server 2019 - https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019

Server 2016 - https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2016

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper7.PNG)

You should have a hyper-v layout similar to this. I would recommend enabling the TPM in the security section and increasing the processors to atleast 2. Also you can uncheck the server from doing checkpoints. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Hyper8.PNG)

Next boot up the virtual machine. At the time I documented with server 2016 but server 2019 is the same. Click on next to continue.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows1.PNG)

Click on Install Now

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows2.PNG)

Select that standard evaluation option. It's unnecessary to run your first domain controller with the Datacenter SKU. You will notice I am choosing to not install server with desktop experience. This is preferred to lower the threat surface to your first domain controller. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows3.PNG)

Accept the licensing terms

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows4.PNG)

Choose on custom and click on next

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows5.PNG)

Click on Disk 0 and click on next

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows6.PNG)

At this point the installation will begin.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows7.PNG)

After the installation has ended and the server boots up you will need give the local administrator a password.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows8.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows9.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/Windows10.PNG)

## Patching all the things

You will notice we are still in a unconnected and unpatched state on the server. From a secure machine you will need to download security patches from https://catalog.update.microsoft.com

You can download the latest Windows Defender definitions from the following site https://www.microsoft.com/en-us/wdsi/definitions

The following script can be used as a reference for what you need to download. Just type in the KB number (ex. kb4132216) into the search field on the Microsoft catalog site search bar.

If using 2016 use this script:

https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Scripts/Secure2016.bat

If using 2019 use this script:

https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Scripts/Secure2019.bat

I am constantly modifying this script as Microsoft rolls out KB updates. You will also need a program to add the script above and the Microsoft KB's to a CD ISO image. You can use software such as http://www.freeisoburner.com/ 

Once you have everything in your ISO image ready to go you will need to mount the CD image in your hyper-v session by going to into settings on the virtual machine and selecting the CD ISO that you created. From there type in the following:

```
cd d:\
Secure(os verion).bat
```
Warning: If you are patching Server 2016 for the first time this will end up taking a while (atleast 40 mins). So go fix a sandwhich...coffee...bourbon and watch some netflix.

## Hyper-V Virtual Networking
There are two path's to take when it comes to Hyper-V networking:

**The Easy Path:**

The easy path consists of setting up a private hyper-v switch. A few things to note about setting up a private hyper-v switch. 
 
-It's isolated and will never be connected to the internet

-Low technical knowledge needed to create

**The Hard Path:**

The hard path consists of of setting up multiple hyper-v switches and setting up a pfsense firewall. This method provides more benefits in terms of building your lab with internet access and segmenting your domain network from your home network. 

Documentation:

**Setting up a private Hyper-V network switch (The Easy Path)** 

https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/HyperVNetworkingEasy.md
 
 **Setting up a pfsense firewall and multiple Hyper-V Switches(The Hard Path)**
 
 Insert Link to Documentation here
 
 ## Completing Domain Controller Install
 If you reached this point you should have the following done
 
 - Server 2016/2019 OS has been patched
 - Your first server is connected with a hyper-v switch
 
The first step in completing the domain controller install is to provide a static IP to your network card. In order to do this we first need to obtain the interface index to the nic card on the virtual machine. To do so enter powershell and run the command Get-NetAdapter as shown below

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PowerShell1.PNG)

Next we need to run the following script. Make sure you change the Interface Index to what your network card is assigned to from the previous step. You can set whatever static IP address you would like your domain controller to be. In the easy network setup you only need to have one DNS server and it needs to be the IP of your domain controller. The connection Specific suffix is what your domain name is going to be. Mine is called seclab.local

To invoke this powershell script you can either copy and paste my code or copy this powershell script to the domain controller. To execute please do the following.

./InitialConfig_Domain_Controller.ps1

https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Scripts/InitialConfig_Domain_Controller.ps1

```
New-NetIPaddress -InterfaceIndex 2 -IPAddress 172.16.2.5 -PrefixLength 24 -DefaultGateway 172.16.2.1
Set-DNSClientServerAddress –InterfaceIndex 2 -ServerAddresses 172.16.2.5,172.16.2.1
Set-DnsClient -InterfaceIndex 2 -ConnectionSpecificSuffix "seclab.local"
Rename-Computer -NewName "DC1" -Restart
```

After you have selected a static IP and configured your DNS settings we will promote the first domain controller using the following powershell script. Reminder that your domain name does not have to be seclab.local

https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Scripts/Install_First_DC.ps1

```
Get-WindowsFeature AD-Domain-Services | Install-WindowsFeature
Import-Module ADDSDeployment
Install-ADDSForest -DomainName “seclab.local”
```

These next few screenshots show this process in its entirety.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StaticDCConfig1.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/StaticDCConfig2.PNG)

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/InstallDC1.PNG)

At this point your Domain Controller Should Reboot. Now for a bit of troubleshooting to verify your new Domain Controller has the proper filewall profile. Log into the domain controller. Verify it has the correct firewall profile. If it says "Public" You will need to set the nic to "not connected" then swap it back. Below illustrates the process of troubleshooting by using the following command in powershell.

```
Get-NetConnectionProfile

```

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/InstallDC2%20-%20Troubleshooting.PNG)

This should conclude setting up your first server in your lab as a domain controller.
