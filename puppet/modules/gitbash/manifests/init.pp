class gitbash {
  file {"C:\Users\vagrant\Git-1.9.5-preview20150319.exe":
    ensure  => present,
    source  => "puppet:///modules/gitbash/Git-1.9.5-preview20150319.exe",
    source_permissions  => 'ignore',
    notify  => Exec["install_gitbash"],
  } ->
  exec {"install_gitbash":
    command     => "C:\Users\vagrant\Git-1.9.5-preview20150319.exe /VERYSILENT /COMPONENTS=\"icons,ext\reg\shellhere,assoc,assoc_sh\" ",
    refreshonly => true,
  }
}