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
   
## How to automate spreading fake ad creds with group policy
