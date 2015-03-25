class jdk ($version) {
  file { "jdk-$version-windows-x64.exe":
        source              => "puppet:///modules/jdk/jdk-$version-windows-x64.exe",
        source_permissions  => 'ignore',
        path                => "C:\ProgramData\PuppetLabs\puppet\etc\jdk-$version-windows-x64.exe",
      } 
      package { 'Java SE Development Kit 7 Update 75 (64-bit)':
        # This needs to match the "Name" under Add/remove programs
        # Or, you can run `puppet resource package`
        ensure          => installed,
        source          => "C:\ProgramData\PuppetLabs\puppet\etc\jdk-$version-windows-x64.exe",
        install_options => ['/Q'],
        require         => File["jdk-$version-windows-x64.exe"]
      }
}