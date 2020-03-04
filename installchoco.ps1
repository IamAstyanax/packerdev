# Self-elevate to admin
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
     $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
     Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
     Exit
    }
   } 
   
   
   
   #install chrome on server lol
   
        
   
   $installChrome = Read-Host "Would you like to install Google Chrome? <Yes/No>" 
   
          
          If ($installChrome -eq "yes")
          {
              choco install googlechrome -y }
              
          Elseif ($installChrome -eq "no")
          { echo "not installing Chrome"
              
   }
   
   
   #install np++ for text file editing
   choco install notepadplusplus -y
   
   #install abc-update for patch management
   
        
   
   $installAbc = Read-Host "Would you like to install ABC-Update for MS patching? <Yes/No>" 
   
          
          If ($installAbc -eq "yes")
          {
              choco install abcupdate -y }
              
          Elseif ($installAbc -eq "no")
          { echo "not installing abcupdate" }
              
   
   
   #install snmp with netman string
   c:\git\packerdev\install_snmp.ps1
   
   
   
   
   
   
   
   
   Unregister-ScheduledTask -Taskname InstallGit -a
   
   
   $installServerRoles = Read-Host "Would you like to install Roles via this script? <Yes/No>" 
   
          
          If ($installServerRoles -eq "yes")
          {
           c:\git\packerdev\install_roles.ps1 }
              
          Elseif ($installServerRoles -eq "no")
          { echo "not installing roles" 
        
          }
   
   
          $domainjoin = Read-Host "Would you like to join a domain and rename the computer" 
   
          
          If ($domainjoin -eq "yes")
          {
           .\domain_join.ps1 }
              
          Elseif ($domainjoin -eq "no")
          { echo "not joining domain" 
        
          }
   
   
   Write-Host "script complete"