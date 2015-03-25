$shell = new-object -com "Shell.Application"  
$folder = $shell.Namespace('C:\Program Files (x86)\Mozilla Firefox')    
$item = $folder.Parsename('firefox.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}