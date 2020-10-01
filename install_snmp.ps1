
$name = yourname
Install-windowsfeature -name SNMP-SERVICE

Start-Sleep -Seconds 30

Install-WindowsFeature RSAT-SNMP

Start-Sleep -Seconds 30

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities"
Set-Location -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities'


New-ItemProperty -Path $registryPath -Name $name -Value 4 `

    -PropertyType DWORD -Force | Out-Null 

end



Remove-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers -Name 1
