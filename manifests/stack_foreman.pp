class stack_foreman (
  $autosign     = true,
  $foreman_host = $::fqdn
) {
  #class { '::puppet':
  #  server => true
  #}
  #class { '::puppetdb': }
  #class { '::puppetdb::master::config': }
  #class { '::foreman': }

  motd::register{ 'Stack : foreman': }
}