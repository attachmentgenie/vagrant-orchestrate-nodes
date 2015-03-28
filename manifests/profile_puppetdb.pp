class profile_puppetdb () {
  class { '::puppetdb':
    listen_address  => '0.0.0.0',
    manage_firewall => false,
  }

  motd::register{ 'Profile : puppetdb': }
}