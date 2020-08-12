#Create random secure password based on SHA hash of computer name
$computer = $env:computername
$StringBuilder = New-Object System.Text.StringBuilder 
[System.Security.Cryptography.HashAlgorithm]::Create("SHA256").ComputeHash([System.Text.Encoding]::UTF8.GetBytes($computer))|
%{ 
    [Void]$StringBuilder.Append($_.ToString("x2")) 
}
$password = $StringBuilder.ToString().substring(1, 14)

#Assign domain
$domain = (Get-WmiObject Win32_ComputerSystem).Domain
        
#Create Honeyhash honeypot
New-HoneyHash -Domain $domain   -Username ITAdmin -Password $password  
