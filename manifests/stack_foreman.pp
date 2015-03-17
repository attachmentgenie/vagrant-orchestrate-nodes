class stack_foreman (
  $admin_password = 'secret',
  $autosign       = true,
  $foreman_host   = $::fqdn,
) {
  #class { '::puppetdb':
  #  listen_address  => '0.0.0.0',
  #  manage_firewall => false,
  #}
  class { '::foreman':
    admin_password => $admin_password,
  }
  class { '::puppet':
    server                      => true,
  #  server_puppetdb_host        => $foreman_host,
  #  server_reports              => 'puppetdb,foreman',
  #  server_storeconfigs_backend => 'puppetdb',
  }

  motd::register{ 'Stack : foreman': }
}