$shell = new-object -com "Shell.Application"  
$folder = $shell.Namespace('C:\Program Files (x86)\Git\bin')    
$item = $folder.Parsename('git.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}