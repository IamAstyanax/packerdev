


# Self-elevate to admin
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}
#Install Choco 
Set-ExecutionPolicy Bypass -Scope Process -Force; `
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  #install the go language
  choco install golang -y
  
#Install git
choco install git -y


#creat git dir
mkdir c:\git

cd c:\git

#clone repo for automation
git clone 
Add-Content c:\git\clonerepo.ps1 "git clone https://github.com/starfox-64/packerdev.git"

c:\git\clonerepo.ps1

cd packerdev


# Resume some stuff

 $installscript = "c:\git\packerdev\installchoco.ps1"
  $A = New-ScheduledTaskAction -execute "powershell.exe" -Argument "-executionpolicy bypass -noprofile -file $installscript"
  $Triggers = New-ScheduledTaskTrigger -AtLogOn
  $user = Env:\USERNAME
  Register-ScheduledTask -TaskName InstallGit-Trigger $Triggers -User $user -Action $A -RunLevel Highest -Force
 
 shutdown -r -t 0