node 'master.dev.com' {
}

node 'test-win7' {
  class {'notepad_plus_plus':}
  class {'keepass':}
  class {'mozilla_firefox':}
  #class {'jdk':
  #  version => '7u75'
  #}
  #class {'apache_directory_studio':}
  class {'winscp':}
 # class {'google_chrome':}
 
 # needs to be tested below
  class {'superputty':}
  class {'sublime_text':}
  class {'gitbash':}
}
