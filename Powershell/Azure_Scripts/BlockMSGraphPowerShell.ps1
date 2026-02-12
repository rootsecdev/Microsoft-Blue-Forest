# Connect-AzAccount prior to running
# MS Graph PowerShell App ID
$AppId = "14d82eec-204b-4c2f-b7e8-296a70dab67e"

Write-Host "[+] Getting Microsoft Graph access token..."

$TokenResponse = Get-AzAccessToken -ResourceUrl "https://graph.microsoft.com"
$Token = [System.Net.NetworkCredential]::new("", $TokenResponse.Token).Password

$Headers = @{
    Authorization = "Bearer $Token"
    "Content-Type" = "application/json"
}

Write-Host "[+] Getting current signed-in user..."
$User = Invoke-RestMethod `
    -Method GET `
    -Uri "https://graph.microsoft.com/v1.0/me" `
    -Headers $Headers

$UserId = $User.id
Write-Host "[+] Current User Object ID: $UserId"

Write-Host "[+] Checking for MS Graph PowerShell service principal..."
$SP = Invoke-RestMethod `
    -Method GET `
    -Uri "https://graph.microsoft.com/v1.0/servicePrincipals?`$filter=appId eq '$AppId'" `
    -Headers $Headers

if (-not $SP.value) {

    Write-Host "[!] Service principal not found. Creating it..."

    $CreateBody = @{
        appId = $AppId
    } | ConvertTo-Json

    $NewSP = Invoke-RestMethod `
        -Method POST `
        -Uri "https://graph.microsoft.com/v1.0/servicePrincipals" `
        -Headers $Headers `
        -Body $CreateBody

    $SpId = $NewSP.id

    Write-Host "[+] Created service principal: $SpId"

    # Small delay to allow directory replication
    Start-Sleep -Seconds 5
}
else {
    $SpId = $SP.value[0].id
    Write-Host "[+] Found existing service principal: $SpId"
}

Write-Host "[+] Enabling 'Assignment Required'..."
$Body = @{
    appRoleAssignmentRequired = $true
} | ConvertTo-Json

Invoke-RestMethod `
    -Method PATCH `
    -Uri "https://graph.microsoft.com/v1.0/servicePrincipals/$SpId" `
    -Headers $Headers `
    -Body $Body

Write-Host "[+] Removing existing app role assignments..."
$Assignments = Invoke-RestMethod `
    -Method GET `
    -Uri "https://graph.microsoft.com/v1.0/servicePrincipals/$SpId/appRoleAssignedTo" `
    -Headers $Headers

foreach ($Assignment in $Assignments.value) {
    Invoke-RestMethod `
        -Method DELETE `
        -Uri "https://graph.microsoft.com/v1.0/servicePrincipals/$SpId/appRoleAssignedTo/$($Assignment.id)" `
        -Headers $Headers
}

Write-Host "[+] Assigning current user access..."
$AssignmentBody = @{
    principalId = $UserId
    resourceId  = $SpId
    appRoleId   = "00000000-0000-0000-0000-000000000000"
} | ConvertTo-Json

Invoke-RestMethod `
    -Method POST `
    -Uri "https://graph.microsoft.com/v1.0/users/$UserId/appRoleAssignments" `
    -Headers $Headers `
    -Body $AssignmentBody

Write-Host "MS Graph PowerShell is now blocked for everyone except you."
