# Building a PFSENSE Firewall in Hyper-V

1. In Hyper-V go to your switch manager. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE1.PNG)
   
2. You will need to create three virtual switches. 

- Create a virtual switch that can connect directly to your external network using the NIC card that provides your internet connectivity. 
   
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE2.PNG)
   
- Create a virtual switch for your internal network. Label it as your management network. Keep in mind the management network you will be able to access from your Hyper-V host.
   
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE3.PNG)
   
- Create a virtual switch for your private network. Lable it as your private switch. This switch will not have access to your host. This is so we can run things like Active Directory without affecting your host or other devices on your home network. 
  
  ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE4.PNG)
  
3. Create a New virtual machine on the actions menu

4. Specify the name and location of where you want to run your pfsense vm. I prefer to run mine on a secondary disk from where my host is running. 
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE5.PNG)
   
5. Select Gen 1 for the generation of the virtual machine type. 
 
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE6.PNG)

6. Assign 512mb of memory and uncheck use dynamic memory for this virtual machine. 
  
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE7.PNG)
   
7. For now select your bridged network connection for your connection type. We will add more connections after the VM is created. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE8.PNG)
   
8. Allocate 2 gig worth of space for the VM. This should be more than enough to run a pfsense box and upgrade the pfsense box as needed. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE9.PNG)
   
9. Select your pfsense iso. IF you don't have it you can download from this URL: https://www.pfsense.org/download/

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE10.PNG)
   
10. Click on finish.
   
    ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE11.PNG)
    
 ## Adding more network cards to your pfsense VM
 
 1. Double click on your pfsense VM and click on File >> Settings. Select Network Adapter under the hardware section. Click on Add.
    
    ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE12.PNG)
    
 2. Add your management network and your private switch.
    ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE13.PNG)
    ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE14.PNG)
    
 3. After all network cards are added. Power up the VM once. Once it is powered back on please shut it back down. This is so MAC addresses get allocated to all three network cards. 
 
 4. Open the VM settings under File >> Settings on your pfsense box again. Expand the "+" sign next to all three of your network adapters. Once they are all expanded you will need to set the mac address to static on each network card. Document the MAC address to your Bridged Network, Management Network, and IPS1 (Your Private switch). An example of this is shown below:
 
    ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/PFSENSE15.PNG)
   
5. Before we start our PFsense VM we should have the following documented:
   
   - MAC Addresses for each network card
   - The IP address range we want to use for the Management Network, and Private switch.
   - The IP address range for the private switch **must** match the IP address range your domain controller sits on
