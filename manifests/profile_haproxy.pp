class profile_haproxy {
  class { 'haproxy': }
  haproxy::listen { 'platform-http':
    collect_exported => false,
    ipaddress        => $::ipaddress_eth1,
    mode             => 'http',
    options          => { 'option'      => [ 'tcplog',
                                             'ssl-hello-chk' ],
                          'balance'     => 'roundrobin',
                          'stats uri'   => '/haproxy_stats',
                        },
    ports            => '80',
  }

  Haproxy::Balancermember <<| |>>

  motd::register{ 'Profile : haproxy': }
}