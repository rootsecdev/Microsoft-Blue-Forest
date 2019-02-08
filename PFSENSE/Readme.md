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
