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
