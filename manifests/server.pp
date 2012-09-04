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
  motd::register{ 'Module : logrotate': }

  #Setup repositories
  class { 'apt':
    always_apt_update => true,
  }

  motd::register{ 'Module : apt': }

  #Install default applications
  case $::operatingsystem {
    default: { $default_packages = ['subversion','git','tree','zip','unzip','ant','ant-contrib','python-setuptools','ruby','rubygems','curl'] }
  }

  package { $default_packages:
    ensure  => latest,
    require => Exec['apt_update'],
  }

  #Setup services
  class { 'locales': }
  motd::register{ 'Module : locales': }

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
  logrotate::rule { 'ufw':
    path          => '/var/log/ufw.log',
    rotate        => 4,
    rotate_every  => 'week',
    missingok     => true,
    ifempty       => false,
    compress      => true,
    delaycompress => true,
    sharedscripts => true,
    postrotate    => 'invoke-rc.d rsyslog reload >/dev/null 2>&1 || true',
  }
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
    proto => 'udp',
  }
  class {'ganglia::server':
    clusters     => [{cluster_name  => 'nodes', cluster_hosts => [{address => 'localhost', port    => '8649'}]}],
    gridname     => 'orchestrate-nodes',
  }
  class {'ganglia::webserver': }
  ufw::allow { 'allow-all-http-80-from-all':
    port => 80,
  }
  motd::register{ 'Module : ganglia': }

  class {'logstash::common':
    logstash_jar_provider => 'http',
  }
  class {'logstash::indexer': }
  motd::register{ 'Module : logstash': }

  #Install default applications
  case $::operatingsystem {
    default: { $mcollective_packages = ['mcollective','mcollective-client','mcollective-common','mcollective-middleware'] }
  }

  package { $mcollective_packages:
    ensure  => latest,
    require => Exec['apt_update'],
  }
  ufw::allow { 'allow-all-mcollective-from-all':
    port => 6163,
  }
  motd::register{ 'Module : mcollective': }

  #Install applications to provision machines
  case $::operatingsystem {
    default: { $provision_packages = ['byobu'] }
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
    dashboard           => false,
    dashboard_passenger => false,
    dashboard_site      => 'puppet',
    certname            => 'puppet',
  }
  ufw::allow { 'allow-all-http-8080-from-all':
    port => 8080,
  }
  logrotate::rule { 'apache2':
    path          => '/var/log/apache2/*.log',
    rotate_every  => 'week',
    missingok     => true,
    rotate        => 52,
    compress      => true,
    delaycompress => true,
    ifempty       => false,
    create        => true,
    create_mode   => 640,
    create_owner  => 'root',
    create_group  => 'adm',
    sharedscripts => true,
    postrotate    => '/etc/init.d/apache2 reload > /dev/null',
  }

  motd::register{ 'Module : puppetmaster': }
  #motd::register{ 'Module : puppet-dashboard': }
  motd::register{ 'Module : apache': }
  motd::register{ 'Module : passenger': }
