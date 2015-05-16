node 'win7.localdomain' {
  class {'notepad_plus_plus':}
  class {'keepass':}
  class {'mozilla_firefox':}
  class {'sublime_text':}
  class {'winscp':}
  class {'gitbash':}
  class {'sevenzip':} ->
  class {'superputty':}
}
