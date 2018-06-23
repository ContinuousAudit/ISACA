Import-Module ActiveDirectory
Import-Module GroupPolicy 
$dc = Get-ADDomainController -Discover -Service PrimaryDC
Get-GPOReport -All -Domain your.domain -Server $dc -ReportType HTML -Path C:\Temp\GPOReportsAll.html  
