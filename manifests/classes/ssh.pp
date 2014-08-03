class classes::ssh {

  class { 'motd': }
  motd::register{ 'Module : motd': }

#  class { 'ssh::client': }
#  motd::register{ 'Module : ssh::client': }
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
  motd::register{ 'Module : ssh::server': }
}