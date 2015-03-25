# Author:: David J Felix
# Copyright:: Copyright (c) 2015 David J Felix
# License:: MIT

class notepad_plus_plus(
  $npp_url='http://download.tuxfamily.org/notepadplus/6.7.4/npp.6.7.4.Installer.exe',
  $destination_directory='C:\ProgramData\PuppetLabs\puppet\etc',
  $destination_file='npp.exe',
  $proxy_address='',
  $proxy_user='',
  $proxy_password='',
  $is_password_secure=false
) {
  case $::osfamily {
    'Windows': {
      download_file { 'npp.exe':
        url                   => $npp_url,
        destination_directory => $destination_directory,
        destination_file      => $destination_file,
        proxy_address         => $proxy_address,
        proxy_user            => $proxy_user,
        proxy_password        => $proxy_password,
        is_password_secure    => $is_password_secure 
      }
      package { 'npp.exe':
        ensure          => installed,
        source          => "${destination_directory}\\${destination_file}",
        install_options => ['/S'],
        require         => Download_file['npp.exe']
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}
