New-NetIPaddress -InterfaceIndex 2 -IPAddress 172.16.2.5 -PrefixLength 24 -DefaultGateway 172.16.2.1
Set-DNSClientServerAddress –InterfaceIndex 2 -ServerAddresses 172.16.2.5,172.16.2.1
Set-DnsClient -InterfaceIndex 2 -ConnectionSpecificSuffix "seclab.local"