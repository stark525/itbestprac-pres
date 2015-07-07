class sevenzip {
  case $::osfamily {
    'windows': {
		  file { 'C:\7z920-x64.msi':
		    ensure	=> present,
		    source  => 'puppet:///modules/sevenzip/7z920-x64.msi',
		  }
		  package { '7zip':
		    ensure    => present,
		    source    => 'C:\7z920-x64.msi',
		    subscribe => File['C:\7z920-x64.msi'],
		  }
	  }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}