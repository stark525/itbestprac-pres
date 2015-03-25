If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}
$puppetVersion = '3.7.4'
$storageDir = $pwd
$webclient = New-Object System.Net.WebClient
$url = "https://downloads.puppetlabs.com/windows/puppet-$puppetVersion-x64.msi"
$file = "$storageDir\puppet-$puppetVersion-x64.msi"
$webclient.DownloadFile($url,$file)
msiexec /jm "$storageDir\puppet-$puppetVersion-x64.msi"
msiexec /qn /i "$storageDir\puppet-$puppetVersion-x64.msi" PUPPET_MASTER_SERVER=master.dev.com

ac -Encoding UTF8  C:\Windows\system32\drivers\etc\hosts "10.1.1.10 master.dev.com"