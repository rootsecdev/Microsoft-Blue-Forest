Get-WindowsFeature AD-Domain-Services | Install-WindowsFeature
Import-Module ADDSDeployment
Install-ADDSForest -DomainName “seclab.local”
