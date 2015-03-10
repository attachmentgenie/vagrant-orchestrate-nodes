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
  haproxy::balancermember { 'node1':
    listening_service => 'platform-http',
    server_names      => 'node1.testlab.vagrant',
    ipaddresses       => '192.168.21.151',
    ports             => '80',
  }
  haproxy::balancermember { 'node2':
    listening_service => 'platform-http',
    server_names      => 'node2.testlab.vagrant',
    ipaddresses       => '192.168.21.152',
    ports             => '80',
  }
  haproxy::balancermember { 'node3':
    listening_service => 'platform-http',
    server_names      => 'node3.testlab.vagrant',
    ipaddresses       => '192.168.21.153',
    ports             => '80',
  }
  haproxy::balancermember { 'node4':
    listening_service => 'platform-http',
    server_names      => 'node4.testlab.vagrant',
    ipaddresses       => '192.168.21.154',
    ports             => '80',
  }
  haproxy::balancermember { 'node5':
    listening_service => 'platform-http',
    server_names      => 'node5.testlab.vagrant',
    ipaddresses       => '192.168.21.155',
    ports             => '80',
  }
}