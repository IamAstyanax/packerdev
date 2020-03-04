#inputs for credentials / domain / computer name
Do {
    $hostname = Read-Host "What is the computer / server hostname? " 
    $Domain = Read-Host "Enter your domain <bmoat.com>  "
    $user = Read-Host "Enter your admin account username"
    $username = "$Domain\$user"
    Read-host "Enter your password (I'll encrypt this, I promise ;)"  -assecurestring | convertfrom-securestring | out-file C:\mysecurestring.txt
    Write-host " "
    Write-host "You wrote: $hostname | $Domain | $user" 
    $answer = Read-host "Does this look all good and dandy? <yes/no>? " 
        
        If ($answer -eq "yes")
        {
            $success = 1 }
        Elseif ($answer -eq "no")
        {
            Clear
            Write-host "CLEARED VALUE"
            $success = 0}
 }
       

  #Join domain/Rename
  Rename-Computer -NewName $hostname
  sleep 5
  Add-Computer -ComputerName $Oldhostname -DomainName $Domain -credential $cred -force -Options JoinWithNewName,AccountCreate -restart
  
  
