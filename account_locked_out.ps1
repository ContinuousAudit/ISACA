#Powershell User Account locked out Maxzor1908 *16/4/2013* 
 
$Report= "c:\powershell\html.html" 
 
$HTML=@" 
<title>Account locked out Report</title> 
<!--mce:0--> 
"@ 
 
$Account_Name = @{n='Account name';e={$_.ReplacementStrings[-1]}} 
$Account_domain = @{n='Account Domain';e={$_.ReplacementStrings[-2]}} 
$Caller_Computer_Name = @{n='Caller Computer Name';e={$_.ReplacementStrings[-1]}} 
 
             
$event= Get-EventLog -LogName Security -InstanceId 4740 -Newest 1 | 
   Select TimeGenerated,ReplacementStrings,"Account name","Account Domain","Caller Computer Name" | 
   % { 
     New-Object PSObject -Property @{ 
      "Account name" = $_.ReplacementStrings[-7] 
      "Account Domain" = $_.ReplacementStrings[5] 
      "Caller Computer Name" = $_.ReplacementStrings[1] 
      Date = $_.TimeGenerated 
    } 
   } 
    
  $event | ConvertTo-Html -Property "Account name","Account Domain","Caller Computer Name",Date -head $HTML -body  "<H2> User is locked in the Active Directory</H2>"| 
     Out-File $Report -Append 
 
$MailBody= Get-Content $Report 
$MailSubject= "User Account locked out" 
$SmtpClient = New-Object system.net.mail.smtpClient 
$SmtpClient.host = "smtp.yoursmtpserver" 
$MailMessage = New-Object system.net.mail.mailmessage 
$MailMessage.from = "account_locked_out@........com" 
$MailMessage.To.add("youremail@youremail.com") 
$MailMessage.Subject = $MailSubject 
$MailMessage.IsBodyHtml = 1 
$MailMessage.Body = $MailBody 
$SmtpClient.Send($MailMessage) 
 
del c:\powershell\html.html
