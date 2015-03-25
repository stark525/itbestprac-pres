class sublime_text {
  case $::osfamily {
    'windows': {
      file { 'Sublime-2.0.2.exe':
        source              => 'puppet:///modules/sublime_text/Sublime-2.0.2.exe',
        source_permissions  => 'ignore',
        path                => 'C:\ProgramData\PuppetLabs\puppet\etc\Sublime-2.0.2.exe',
      }
      package { 'Sublime Text 2.0.2':
        ensure          => installed,
        source          => 'C:\ProgramData\PuppetLabs\puppet\etc\Sublime-2.0.2.exe',
        install_options => ['/VERYSILENT'],
        require         => File['Sublime-2.0.2.exe'],
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}