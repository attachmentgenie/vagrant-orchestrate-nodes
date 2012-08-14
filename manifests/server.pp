  Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }

  host {'self':
    ensure       => present,
    name         => $fqdn,
    host_aliases => ['puppet', $hostname],
    ip           => $ipaddress,
  }
  motd::register{ 'File : /etc/hosts': }

  class { 'motd': }
  motd::register{ 'Module : motd': }

  #Create users and groups.
  group { 'noc':
    ensure => present,
    gid    => '1010',
  }

  user { 'platform-admin':
    ensure   => present,
    uid      => '1010',
    gid      => '1010',
    home     => '/home/platform-admin',
    shell    => '/bin/bash',
    password => '$6$/3pg4lDJ$JthiJN.q4TgEv7gzazzOqbSgLCJF3ZPHImyqjJ7FeRKbTkUUkzS7cfUScnR5n36G9sX9ppY/L/x4tKJeAQvAz.',
  }

  motd::register{ 'Accounts : platform-admin': }
  motd::register{ 'Groups : noc': }

  #Setup repositories
  class { 'apt': }

  # The Puppet Labs APT source and gpg key.
  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }

  motd::register{ 'Module : apt': }

  #Install default applications
  case $::operatingsystem {
    default: { $default_packages = ['subversion','git','tree','zip','unzip','ant','ant-contrib','python-setuptools','ruby','rubygems'] }
  }

  package { $default_packages:
    ensure  => latest,
    require => Exec['apt_update'],
  }

  #Setup services
  class { 'locales': }
  motd::register{ 'Module : Locales': }

  class { 'timezone':
    zone => 'Europe/Amsterdam',
  }
  motd::register{ 'Module : timezone': }

  class { 'network::interfaces':
    interfaces => {
      'eth0' => {
        'method' => 'dhcp',
      }
    },
    auto       => ['eth0'],
  }
  motd::register{ 'Module : network': }

  class { 'ufw': }
  motd::register{ 'Module : ufw': }

  class { 'ssh::client': }
  ufw::allow { 'allow-all-ssh-from-all':
    port => 22,
  }
  motd::register{ 'Module : ssh': }

  class { 'ntp': }
  ufw::allow { 'allow-all-ntp-from-all':
    port => 123,
  }
  motd::register{ 'Module : ntp': }

  class { 'rsyslog::client': }
  motd::register{ 'Module : rsyslog': }

  class { 'puppet::agent':
    puppet_server => 'puppet',
  }
  motd::register{ 'Module : puppet': }

  class {'ganglia::client':
    cluster           => 'nodes',
    network_mode      => 'unicast',
    unicast_targets   => [{'ipaddress' => '127.0.0.1', 'port' => '8649'}],
  }

  ufw::allow { 'allow-udp-8649-from-all':
    port  => 8649,
    proto => "udp",
  }
  class {'ganglia::server':
    clusters     => [{cluster_name => 'nodes', cluster_hosts => [{address => 'localhost', port => '8649'}]}],
    gridname     => 'orchestrate-nodes',
  }
  class {'ganglia::webserver': }
  ufw::allow { 'allow-all-http-80-from-all':
    port => 80,
  }
  motd::register{ 'Module : ganglia': }

  class { 'mcollective':
    client       => true,
    stomp_server => 'localhost',
  }
  motd::register{ 'Module : mcollective': }
>>>>>>> 187e727c9113f1c1e83dc286140d6376981589a6

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
  ufw::allow { 'allow-all-http-8080-from-all':
    port => 8080,
  }
  motd::register{ 'Module : puppetmaster': }
  motd::register{ 'Module : puppet-dashboard': }
  motd::register{ 'Module : apache': }
  motd::register{ 'Module : passenger': }