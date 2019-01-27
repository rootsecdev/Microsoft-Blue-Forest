# Hyper-V Networking Made Easy
This is an introduction into private hyper-v networking. This setup involves creating a private network switch that does not share a connection with your host machine or the internet. 

In the right hand panel select virtual switch manager 

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/HVNetEasy1.PNG)

Next select the "Private" as the type of virtual switch you want to create. Then select "Create virtual switch" and click on ok.

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/HVNetEasy2.PNG)

Give the switch a name and make sure private network is selected as the connection type

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/HVNetEasy3.PNG)

Click on your Server 2016 or Server 2019 lab domain controller and select the Virtual switch you created in the previous step

![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/HVNetEasy4.PNG)
