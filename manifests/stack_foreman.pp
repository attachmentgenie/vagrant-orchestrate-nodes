class stack_foreman (
  $admin_password = 'secret',
  $autosign       = true,
  $foreman_host   = $::fqdn,
) {
  #class { '::puppetdb':
  #  listen_address  => '0.0.0.0',
  #  manage_firewall => false,
  #}
  #class { '::foreman':
  #  admin_password => $admin_password,
  #}
  class { '::puppet':
    runmode               => 'none',
    server                => true,
    server_foreman        => false,
    server_reports        => 'store',
    server_external_nodes => '',
  }

  motd::register{ 'Stack : foreman': }
}