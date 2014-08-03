class classes::access {

  case $::osfamily {
    'debian': {
      class { 'ufw': }
      motd::register{ 'Module : ufw': }
    }
    'redhat': {
      class { 'firewall': }
      motd::register{ 'Module : firewall': }
    }
    default: {
      fail("Unsupported osfamily ${::osfamily}")
    }
  }
}