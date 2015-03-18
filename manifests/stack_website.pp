class stack_website {
  class { '::apache': }

  @@haproxy::balancermember { $::hostname:
    listening_service => 'platform-http',
    server_names      => $::fqdn,
    ipaddresses       => $ipaddress_eth1,
    ports             => '80',
  }

  motd::register{ 'Stack : website': }
}