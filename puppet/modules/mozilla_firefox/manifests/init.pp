class mozilla_firefox {
  case $::osfamily {
    'windows': {
      file { 'FirefoxSetup36.0.exe':
        source              => 'puppet:///modules/mozilla_firefox/FirefoxSetup36.0.exe',
        source_permissions  => 'ignore',
        path                => 'C:\ProgramData\PuppetLabs\puppet\etc\FirefoxSetup36.0.exe',
      } 
      package { 'Mozilla Firefox':
        # This needs to match the "Name" under Add/remove programs
        # Or, you can run `puppet resource package`
        ensure          => installed,
        source          => "C:\ProgramData\PuppetLabs\puppet\etc\FirefoxSetup36.0.exe",
        install_options => ['-ms'],
        require         => File['FirefoxSetup36.0.exe']
      }
      exec {"pin_ff":
        command   => template('firefox/pin_firefox.ps1'),
        provider  => powershell,
        refreshonly => true,
        subscribe   => Package['Mozilla Firefox'],
      }          
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}