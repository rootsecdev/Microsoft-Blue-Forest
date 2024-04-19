# Azure Resource Graph Query TLS 1.0 Check On Azure Storage

Note: Microsoft will stop supporting TLS 1.0 on Azure storage accounts no later than October 31st, 2024. More info on the retirement can be found at the following URL:

https://azure.microsoft.com/en-us/updates/tls-12-to-become-the-minimum-tls-version-for-azure-storage/

Azure Resource Graph query check:

```
resources
| where type == "microsoft.storage/storageaccounts"
| where properties['minimumTlsVersion'] != "TLS1_2"
| project name, resourceGroup, properties.minimumTlsVersion
```
