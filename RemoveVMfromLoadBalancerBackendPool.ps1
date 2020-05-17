function RemoveVMfromLoadBalancerBackendPool
{
    param(
    [Parameter(Mandatory=$true)]
    [string] $applicationID,

    [Parameter(Mandatory=$true)]
    [string] $key,

    [Parameter(Mandatory=$true)]
    [string] $tenantID,

    [Parameter(Mandatory=$true)]
    [string] $vmNicName
    )

    $ErrorActionPreference = "Stop"

    ConnectToAzureADwithSP -key $key -applicationID $applicationID -tenantID $tenantID

    $nic = Get-AzNetworkInterface -Name $vmNicName

    $nic.IpConfigurations[0].LoadBalancerBackendAddressPools = $null

    Set-AzNetworkInterface -NetworkInterface $nic

}

Export-ModuleMember -Function RemoveVMfromLoadBalancerBackendPool