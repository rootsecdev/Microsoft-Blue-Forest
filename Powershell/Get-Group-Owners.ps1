# Get all public M365 groups and their owners. This script is useful to monitor overprovisioning in Sharepoint online. 
# Install-Module AzureAD
Connect-AzureAD
$publicGroups = Get-AzureADGroup -Filter "MailEnabled eq true and SecurityEnabled eq false"

# Loop through each group and get the owners
foreach ($group in $publicGroups) {
    Write-Output "Group: $($group.DisplayName)"
    $owners = Get-AzureADGroupOwner -ObjectId $group.ObjectId | Select DisplayName, UserPrincipalName
    $owners | ForEach-Object {
        Write-Output "Owner: $($_.DisplayName) - Email: $($_.UserPrincipalName)"
    }
    Write-Output ""
}
