class apache_directory_studio {
  file { "ApacheDirectoryStudio-win32-x86_64-2.0.0.v20130628.exe":
      source              => "puppet:///modules/apache_directory_studio/ApacheDirectoryStudio-win32-x86_64-2.0.0.v20130628.exe",
      source_permissions  => 'ignore',
      path                => "C:\ProgramData\PuppetLabs\puppet\etc\ApacheDirectoryStudio-win32-x86_64-2.0.0.v20130628.exe",
  } 
  package { 'Apache Directory Studio':
    ensure          => installed,
    source          => "C:\ProgramData\PuppetLabs\puppet\etc\ApacheDirectoryStudio-win32-x86_64-2.0.0.v20130628.exe",
    install_options => ['/S /D'],
    require         => File["ApacheDirectoryStudio-win32-x86_64-2.0.0.v20130628.exe"]
  }
}