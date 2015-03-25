class keepass {
  case $::osfamily {
    'windows': {
      file { 'KeePass-2.28-Setup.exe':
        source              => 'puppet:///modules/keepass/KeePass-2.28-Setup.exe',
        source_permissions  => 'ignore',
        path                => 'C:\ProgramData\PuppetLabs\puppet\etc\KeePass-2.28-Setup.exe',
      }
      package { 'KeePass-2.28-Setup.exe':
        ensure          => installed,
        source          => 'C:\ProgramData\PuppetLabs\puppet\etc\KeePass-2.28-Setup.exe',
        install_options => ['/VERYSILENT'],
        require         => File['KeePass-2.28-Setup.exe'],
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}