class profile_puppetmaster () {
  class { '::puppet':
    runmode                     => 'none',
    server                      => true,
    server_external_nodes       => '',
    server_foreman              => false,
    server_puppetdb_host        => $::fqdn,
    server_reports              => 'puppetdb,foreman',
    server_storeconfigs_backend => 'puppetdb',
  }

  motd::register{ 'Profile : puppetmaster': }
}