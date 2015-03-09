class profile_network {

#  class { 'network::interfaces':
#    interfaces => {
#      'eth0' => {
#        'method' => 'dhcp',
#      }
#    },
#    auto       => ['eth0'],
#  }
}