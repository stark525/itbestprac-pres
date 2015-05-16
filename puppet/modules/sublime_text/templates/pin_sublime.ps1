$shell = new-object -com "Shell.Application"  
$folder = $shell.Namespace('C:\Program Files\Sublime Text 2')    
$item = $folder.Parsename('sublime_text.exe')
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
if ($verb) {$verb.DoIt()}