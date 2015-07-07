class superputty {
  case $::osfamily {
    'windows': {
      file { "C:\ProgramData\PuppetLabs\puppet\etc\SuperPutty-1.4.0.5.zip":
        ensure              => present,
        source              => "puppet:///modules/superputty/SuperPutty-1.4.0.5.zip",
        source_permissions  => 'ignore',
        notify              => Exec["unzip_SuperPutty"],
      } ->
      exec { "unzip_SuperPutty":
        command     => "\"C:\Program Files\7-Zip\7z.exe\" x -y C:\ProgramData\PuppetLabs\puppet\etc\SuperPutty-1.4.0.5.zip -o\"C:\Program Files\SuperPutty\"",
        refreshonly => true,
      }
      exec { "pin_superputty":
        command     => template('superputty/pin_superputty.ps1'),
        provider    => powershell,
        refreshonly => true,
        subscribe   => Exec["unzip_SuperPutty"],
      }
    }      
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}