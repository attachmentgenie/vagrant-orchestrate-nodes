class stack_bootstrap {

  stage { 'before':
    before => Stage['main'],
  }
  class { '::epel':
    stage => before,
  }
  class { '::motd': }
  class { '::profile_icinga': }
  class { '::profile_firewall': }
  class { '::profile_log_client': }
  class { '::profile_locale': }
  class { '::profile_network': }
  class { '::profile_repositories': }
  class { '::profile_ssh': }
  class { '::profile_sudo': }
  class { '::profile_time': }

  host {'self':
    ensure       => present,
    name         => $fqdn,
    host_aliases => [$hostname],
    ip           => $ipaddress,
  }

  motd::register{ 'Stack : bootstrap': }
}
