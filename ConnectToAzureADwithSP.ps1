param(
    [string] $applicationID,
    [string] $key,
    [string] $tenantID
)

#Connect to Azure no prompt 
$SecurePassword = $key | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential `
     -argumentlist $applicationID, $SecurePassword

Connect-AzAccount -Credential $cred -Tenant $tenantID -ServicePrincipal