class profile_ruby {

  case $::osfamily {
    'debian': {
      $developerPackages = ['rubygems','ruby','ruby-devel']
    }
    'redhat': {
      $developerPackages = ['rubygems','ruby','ruby-devel']
    }
    default: {
      fail("Unsupported osfamily ${::osfamily}")
    }
  }
  package { $developerPackages: ensure => installed }

  motd::register{ 'Profile : ruby': }
}