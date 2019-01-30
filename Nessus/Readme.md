# Nessus setup for Lab Puposes only

This doument discusses in detail on how to set up a nessus scanner using Cent OS 7. There are two paths for setup depending on your level of comfort. The first path is to install using a Minimal ISO install of Cent OS 7. The second path is setting up a using via gnome desktop. The second path is for those that are intimidated by CLI. 

Personally I prefer using a minimal based CLI install of Cent OS. Along with being less resource intensive it will lower your threat surface risk. A good question is why Cent OS? I like Cent OS for two reasons. 

1. Longivity of the OS and its strict adherance to stable updates. 

2. Firewall is on by default and the ability to choose a security hardening baseline on install.

## Setting up Cent OS7 and Nessus using the minimal install ISO with Hyper-V

1. To download the minimal install ISO for Cent OS you will need to go to the following website:

- https://www.centos.org/download/

2. Select the minimal install ISO link

3. In Hyper-V select New >> Virtual Machine

4. Select Next

5. Specify the name and location. Click on Next.

6. Select Generation 1 for the virtual machine (Cent OS 7 does support Generation 2 but for simiplicity choose Gen 1.

7. Assign 4096 MB memory and uncheck use dynamic memory for this virtual machine. This will ensure the VM does not go over it's allocated memory size.

8. Choose a hyper-v connection that has internet access and click on next.
   - Refer to the following documentation for creating hyper-v switches with internet connections:
   - (Insert Document Link Here)

9. Take the default on creating a virtual hard disk and select next.

10. Navigate to the ISO you saved from step 2 on the installation options screen and select next.

11. Click on Finish to the summary.

12. Start up your Cent OS Virtual Machine. Select Install from the bootup menu.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal1.PNG)

13. Choose what language you would like to use.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal2.PNG)

14. Get into the network and host name settings.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal3.PNG)

15. Turn the ethernet card to the "on" position. Click on Done to this screen.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal4.PNG)

16. Go into the date and time menu next.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal3.PNG)

17. Ensure that NTP is set to the "on" position and select your regional time zone you are on. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal5.PNG)

18. Go to the installation destination from selection on the menu.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal3.PNG)

19. Make sure automatically configure partitioning is selected and ensure encrypt my data is checkmarked. Its important to encrypt this VM as it will contain vulnerability data about your lab network. Those assets and data should be protected when you have the VM in a powered off mode to save on memory and cpu resources. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal6.PNG)

20. Create a secure disk encryption passphrase. If you need help with this I would recommend a password manager such as:
    - KeepassX https://www.keepassx.org/
    - Read Diceware's page on creating secure passphrases http://world.std.com/~reinhold/diceware.html
    
![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal7.PNG)

21. At this point you should be able to select "Begin Installation" from the menu

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal3.PNG)

22. At this screen you will need to create a root password and a user for the Cent OS system. 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/CentOSMinimal8.PNG)



## Setting up Cento OS7 and Nessus using the gnome live CD.
