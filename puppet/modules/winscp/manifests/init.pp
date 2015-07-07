class winscp {
  case $::osfamily {
    'windows': {
      file { "winscp570setup.exe":
          source              => "puppet:///modules/winscp/winscp570setup.exe",
          source_permissions  => 'ignore',
          path                => "C:\ProgramData\PuppetLabs\puppet\etc\winscp570setup.exe",
      } 
      package { 'WinSCP':
        ensure          => installed,
        source          => "C:\ProgramData\PuppetLabs\puppet\etc\winscp570setup.exe",
        install_options => ['/S'],
        require         => File["winscp570setup.exe"]
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}