$shell = new-object -com "Shell.Application"  
$folder = $shell.Namespace('C:\Program Files (x86)\KeePass')    
$item = $folder.Parsename('KeePass.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}