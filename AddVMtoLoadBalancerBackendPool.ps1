function AddVMtoLoadBalancerBackendPool
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
    

    $rgName = "micasaqvRG"
    $LoadBalancerName = "myloadbalancer"

    ConnectToAzureADwithSP -key $key -applicationID $applicationID -tenantID $tenantID

    $nic = Get-AzNetworkInterface -Name $vmNicName -ResourceGroupName $rgName

    $lb = Get-AzLoadBalancer -Name $LoadBalancerName -ResourceGroupName $rgName
    
    $nic.IpConfigurations[0].LoadBalancerBackendAddressPools = $lb.BackendAddressPools

    Set-AzNetworkInterface -NetworkInterface $nic

}

Export-ModuleMember -Function AddVMtoLoadBalancerBackendPool