  Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }

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
  class { 'ufw': }
  motd::register{ 'Module : ufw': }

  class { 'ssh::client': }
  ufw::allow { 'allow-ssh-from-all':
    port => 22,
  }
  motd::register{ 'Module : ssh': }

  class { 'ntp': }
  ufw::allow { 'allow-ntp-from-all':
    port => 123,
  }
  motd::register{ 'Module : ntp': }

  class { 'rsyslog::client': }
  motd::register{ 'Module : rsyslog': }
