$ErrorActionPreference = "Stop"

#Create Service Principal for Automation
#Connect-AzAccount

$existSP = Get-AzADServicePrincipal -DisplayName PabloSP2

If (!$existSP)
{
    $sp = New-AzADServicePrincipal -DisplayName PabloSP2

    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($sp.Secret)
    $UnsecureSecret = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    
    Start-Transcript -Path "C:\PowershellLogs\Azure.txt"
    Write-Host "Password is: $UnsecureSecret"
    
    Write-Host "SP information"
    Get-AzADServicePrincipal -DisplayName PabloSP2
    
    $tenantId = (Get-AzContext).Tenant.Id
    
    Write-Host "Tenant Id is: $tenantId.ToString()"
    
    Stop-Transcript
}
else {
    Write-Host "PabloSP2 already exists"
}


