class gitbash {
  case $::osfamily {
    'windows': {
      file { "C:\ProgramData\PuppetLabs\puppet\etc\Git-1.9.5-preview20150319.exe":
        ensure  => present,
        source  => "puppet:///modules/gitbash/Git-1.9.5-preview20150319.exe",
        source_permissions  => 'ignore',
        notify  => Exec["install_gitbash"],
      } ->
      exec { "install_gitbash":
        command     => "C:\ProgramData\PuppetLabs\puppet\etcGit-1.9.5-preview20150319.exe /VERYSILENT /COMPONENTS=\"icons,ext\reg\shellhere,assoc,assoc_sh\" ",
        refreshonly => true,
      }
      exec { "pin_git":
        command     => template('gitbash/pin_gitbash.ps1'),
        provider    => powershell,
        refreshonly => true,
        subscribe   => Exec["install_gitbash"],
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}