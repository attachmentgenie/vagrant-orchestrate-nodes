class classes::access {

  case $::osfamily {
    'debian': {
      class { 'ufw': }
    }
    'redhat': {
      class { 'firewall': }
    }
    default: {
      fail("Unsupported osfamily ${::osfamily}")
    }
  }
}