class profile_ssh (
  $allowed_users = [],
) {

  class { 'ssh::client': }
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
    allowed_users => ['vagrant','git'],
    print_motd    => $print_motd,
  }
}