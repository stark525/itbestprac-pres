node 'win7' {
  class {'notepad_plus_plus':}
  class {'keepass':}
  class {'mozilla_firefox':}
  class {'sublime_text':}
  class {'winscp':}
  class {'gitbash':}
  class {'sevenzip':} ->
  class {'superputty':}
  
  #class {'jdk':
  #  version => '7u75'
  #}

}
