class google_chrome (
  $keepass_url='https://dl.google.com/update2/installers/ChromeStandaloneSetup64.exe',
  $destination_directory='C:\ProgramData\PuppetLabs\puppet\etc',
  $destination_file='ChromeStandaloneSetup64.exe',
  $proxy_address='',
  $proxy_user='',
  $proxy_password='',
  $is_password_secure=false
) {
  case $::osfamily {
    'windows': {
      download_file { 'ChromeStandaloneSetup64.exe':
        url                   => $keepass_url,
        destination_directory => $destination_directory,
        destination_file      => $destination_file,
        proxy_address         => $proxy_address,
        proxy_user            => $proxy_user,
        proxy_password        => $proxy_password,
        is_password_secure    => $is_password_secure 
      }
      package { 'Google Chrome':
        # This needs to match the "Name" under Add/remove programs
        # Or, you can run `puppet resource package`
        ensure          => installed,
        source          => "${destination_directory}\\${destination_file}",
        install_options => ['/q /I'],
        require         => Download_file['ChromeStandaloneSetup64.exe']
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}