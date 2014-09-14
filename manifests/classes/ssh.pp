class classes::ssh {

  class { 'motd': }

#  class { 'ssh::client': }
  case $::osfamily {
    'debian': {
      $print_motd = 'no'
    }
    'redhat': {
      $print_motd = 'yes'
    }
    default: {
      fail("Unsupported osfamily ${::osfamily}")
    }
  }
  class { 'ssh::server':
    allowed_users => ['vagrant'],
    print_motd    => $print_motd,
  }
#  ufw::allow { 'allow-all-ssh-from-all':
#    port => 22,
#  }
}