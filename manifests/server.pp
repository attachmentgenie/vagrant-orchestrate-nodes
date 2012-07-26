  import 'client.pp'

  #Install applications to provision machines
  case $::operatingsystem {
    default: { $provision_packages = ['juju'] }
  }

  package { $provision_packages:
    ensure  => latest,
    require => Exec['apt_update'],
  }

  case $::operatingsystem {
    default: { $gem_packages = ['librarian-puppet'] }
  }

  package { $gem_packages:
    ensure   => latest,
    provider => gem,
  }

  class { 'puppet': 
    agent               => false,
    master              => true,
    puppet_passenger    => true,
    dashboard           => true,
    dashboard_passenger => true,
    dashboard_site      => 'puppet',
    certname            => 'puppet',
  }
  ufw::allow { 'allow-http-8080-from-all':
    port => 8080,
  }
  motd::register{ 'Module : puppetmaster': }
  motd::register{ 'Module : puppet-dashboard': }
  motd::register{ 'Module : apache': }
  motd::register{ 'Module : passenger': }