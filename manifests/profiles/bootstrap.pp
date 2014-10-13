class profiles::bootstrap {

#  class { 'classes::access': }
  class { 'classes::log_client': }
  class { 'classes::locale': }
  class { 'classes::network': }
  class { 'classes::repositories': }
  class { 'classes::ssh': }
  class { 'classes::sudo': }
  class { 'classes::time': }

  host {'self':
    ensure       => present,
    name         => $fqdn,
    host_aliases => [$hostname],
    ip           => $ipaddress,
  }

  $default_packages = ['curl',
                       'tree',
                       'unzip',
                       'wget',
                       'zip']
  package { $default_packages:
    ensure  => installed,
  }

  motd::register{ 'Profile : bootstrap': }
}
