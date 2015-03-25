class superputty {
  file {"C:\Users\vagrant\SuperPutty-1.4.0.5.zip":
    ensure  => present,
    source  => "puppet:///modules/superputty/SuperPutty-1.4.0.5.zip",
    source_permissions  => 'ignore',
    notify  => Exec["unzip_SuperPutty"],
  } ->
  exec {"unzip_SuperPutty":
    command     => "\"C:\Program Files\7-Zip\7z.exe\" x -y C:\Users\vagrant\SuperPutty-1.4.0.5.zip -oC:\Program Files\SuperPutty",
    refreshonly => true,
  }
}