 
# Self-elevate to admin
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
} 



#install chrome on server lol
choco install googlechrome -y 

#install np++
choco install notepadplusplus -y

#install abc-update for patch management
choco install abc-update -y

#install snmp with netman string
c:\git\packerdev\install_snmp.ps1



#prompt for roles
$installWebServer = Read-Host "Would you like to install IIS? " 

        
        If ($installWebServer -eq "yes")
        {
            c:\git\packerdev\install_iis.ps1 }
            
        Elseif ($installWebServer -eq "no")
        { echo "not installing IIS"
            


 }
     










Unregister-ScheduledTask -Taskname InstallGit -a