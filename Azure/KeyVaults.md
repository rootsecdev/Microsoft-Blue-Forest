# Creating Key Vaults for Encrypted Storage (If VM isn't encrypted)

1. Log on to https://portal.azure.com

2. In the Search bar type in vault. Select KeyVault from the menu.
   
   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/AzureVault1.png)
   
3. Click on the Add button. You will need to give your key vault a name, subscription, resource group, location, pricing tier, access policy, and which virtual networks have access to your key vault.

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/AzureVault2.png)
   
4. Once the deployment succeeds the resource should be created. 

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/AzureVault3.png)
   
5. Use Azure CLI to enable your new key vault for disk encryption. Here is the code snip below:

```
Set-AzKeyVaultAccessPolicy -VaultName 'YourKeyVaultName' -ResourceGroupName 'YourResourceGroup' -EnabledForDiskEncryption
```

6. Use Azure CLI to roll out disk encryption to your VM. Your VM does have to be running in order for this to work. The code below will only encrypt the os. Replace OS with ALL to encrypt multiple disk volumes.

```
az vm encryption enable --resource-group "YourResourceGroup" --name "YourVMName" --disk-encryption-keyvault "YourKeyVaultName" --volume-type OS
```

Example:

   ![](https://github.com/rootsecdev/Microsoft-Blue-Forest/blob/master/Screenshots/AzureVault4.png)
   
7. You can also do this with Azure Powershell vs. CLI. Example Code is below:

```
$KVRGname = 'MyKeyVaultResourceGroup';
$VMRGName = 'MyVirtualMachineResourceGroup';
$vmName = 'MySecureVM';
$KeyVaultName = 'MySecureVault';
$KeyVault = Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $KVRGname;
$diskEncryptionKeyVaultUrl = $KeyVault.VaultUri;
$KeyVaultResourceId = $KeyVault.ResourceId;

Set-AzVMDiskEncryptionExtension -ResourceGroupName $VMRGname -VMName $vmName -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId;
 ```
 ## URL References:
 
 https://docs.microsoft.com/en-us/azure/security/azure-security-disk-encryption-windows
 
 https://docs.microsoft.com/en-us/azure/security/azure-security-disk-encryption-prerequisites
