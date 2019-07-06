How to perform a non-authoritative synchronization of DFSR-replicated SYSVOL (like "D2" for FRS)

Modified from ref url: https://support.microsoft.com/en-us/help/2218556/how-to-force-an-authoritative-and-non-authoritative-synchronization-fo

1. In the ADSIEDIT.MSC tool modify the following distinguished name (DN) value and attribute on each "Broke" do not do on the PDC domain controllers that you want to make non-authoritative:

   CN=SYSVOL Subscription,CN=Domain System Volume,CN=DFSR-LocalSettings,CN=<the server name>,OU=Domain Controllers,DC=<domain>

   msDFSR-Enabled=FALSE

2. Force Active Directory replication throughout the domain. >> Repadmin /syncall /AeD 

3. Run the following command from an elevated powershell prompt on a jumpbox that has DFSR tools installed:

   Update-DfsrConfigurationFromAD -ComputerName "SRV01","SRV02" -Verbose

Ref URL: https://docs.microsoft.com/en-us/powershell/module/dfsr/update-dfsrconfigurationfromad?view=win10-ps

4. You will see Event ID 4114 in the DFSR event log indicating SYSVOL is no longer being replicated.

5. On the same DN from Step 1, set on all broke DC's:

   msDFSR-Enabled=TRUE

6. Force Active Directory replication throughout the domain. >> Repadmin /syncall /AeD 


7. Run the following command from an elevated powershell prompt on a jumpbox that has DFSR tools installed:

   Update-DfsrConfigurationFromAD -ComputerName "SRV01","SRV02" -Verbose

You will see Event ID 4614 and 4604 in the DFSR event log indicating SYSVOL has been initialized. That domain controller has now done a “D2” of SYSVOL.

-----------------------------------------------------------------------------------------------------------------------------------------------------------

How to perform an authoritative synchronization of DFSR-replicated SYSVOL (like "D4" for FRS)

1. In the ADSIEDIT.MSC tool, modify the following DN and two attributes on the domain controller you want to make authoritative (preferrably the PDC Emulator, which is usually the most up to date for SYSVOL contents):

   CN=SYSVOL Subscription,CN=Domain System Volume,CN=DFSR-LocalSettings,CN=<the server name>,OU=Domain Controllers,DC=<domain>

    msDFSR-Enabled=FALSE
    msDFSR-options=1

2. Modify the following DN and single attribute on all other domain controllers in that domain:

   CN=SYSVOL Subscription,CN=Domain System Volume,CN=DFSR-LocalSettings,CN=<each other server name>,OU=Domain Controllers,DC=<domain>

   msDFSR-Enabled=FALSE

3. Force Active Directory replication throughout the domain and validate its success on all DCs. >> Repadmin /syncall /AeD

   Stop then Start the DFSR service set as authoritative(PDC Emulator:)

    You will see Event ID 4114 in the DFSR event log indicating SYSVOL is no longer being replicated.

4. On the same DN from Step 1, set:

   msDFSR-Enabled=TRUE

   Force Active Directory replication throughout the domain and validate its success on all DCs. >> Repadmin /syncall /AeD

5. Run the following command from an elevated powershell prompt on a jumpbox that has DFSR tools installed:

   Update-DfsrConfigurationFromAD -ComputerName "SRV01","SRV02" -Verbose

You will see Event ID 4602 in the DFSR event log indicating SYSVOL has been initialized. That domain controller has now done a “D4” of SYSVOL.

6. Start/restart the DFSR service on the other non-authoritative DCs. You will see Event ID 4114 in the DFSR event log indicating SYSVOL is no longer being replicated on each of them.

Modify the following DN and single attribute on all other domain controllers in that domain:

CN=SYSVOL Subscription,CN=Domain System Volume,CN=DFSR-LocalSettings,CN=<each other server name>,OU=Domain Controllers,DC=<domain>

msDFSR-Enabled=TRUE

Run the following command from an elevated powershell prompt on a jumpbox that has DFSR tools installed:

   Update-DfsrConfigurationFromAD -ComputerName "SRV01","SRV02" -Verbose
