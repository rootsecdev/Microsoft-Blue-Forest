# Microsoft Graph PowerShell App ID
$AppId = "14d82eec-204b-4c2f-b7e8-296a70dab67e"

Write-Host "[+] Getting Microsoft Graph access token..."

$TokenResponse = Get-AzAccessToken -ResourceUrl "https://graph.microsoft.com"
$Token = [System.Net.NetworkCredential]::new("", $TokenResponse.Token).Password

$Headers = @{
    Authorization = "Bearer $Token"
    "Content-Type" = "application/json"
}

Write-Host "[+] Locating Azure AD PowerShell service principal..."

$SP = Invoke-RestMethod `
    -Method GET `
    -Uri "https://graph.microsoft.com/v1.0/servicePrincipals?`$filter=appId eq '$AppId'" `
    -Headers $Headers

if (-not $SP.value) {
    Write-Host "[!] Service principal not found. Nothing to roll back."
    return
}

$SpId = $SP.value[0].id
Write-Host "[+] Found service principal: $SpId"

# Disable assignment requirement
Write-Host "[+] Disabling 'Assignment Required'..."
$Body = @{
    appRoleAssignmentRequired = $false
} | ConvertTo-Json

Invoke-RestMethod `
    -Method PATCH `
    -Uri "https://graph.microsoft.com/v1.0/servicePrincipals/$SpId" `
    -Headers $Headers `
    -Body $Body

# Remove all explicit app role assignments
Write-Host "[+] Removing all app role assignments..."
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

Write-Host "Microsoft Graph PowerShell access has been restored to tenant defaults."
