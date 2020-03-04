#prompt for roles
$installWebServer = Read-Host "Would you like to install IIS? <Yes/No> " 

        
        If ($installWebServer -eq "yes")
        {
            c:\git\packerdev\install_iis.ps1 }
            
        Elseif ($installWebServer -eq "no")
        { echo "not installing IIS"
            


 }
     



 $installDhcpServer = Read-Host "Would you like to install DHCP? <Yes/No> " 

        
        If ($installDhcpServer -eq "yes")
        {
            c:\git\packerdev\install_dhcp.ps1 }
            
        Elseif ($installDhcpServer -eq "no")
        { echo "not installing DHCP"
            


 }

 $installAdds = Read-Host "Would you like to install Active Directory Domain Services? -This will NOT dcpromo automagically <Yes/No>" 

        
 If ($installAdds -eq "yes")
 {
     c:\git\packerdev\install_ADDS.ps1 }
     
 Elseif ($installAdds -eq "no")
 { echo "not installing ADDS"

 }
