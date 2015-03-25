$shell = new-object -com "Shell.Application"  
$folder = $shell.Namespace('C:\Program Files\SuperPutty\SuperPutty-1.4.0.5')    
$item = $folder.Parsename('SuperPutty.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}