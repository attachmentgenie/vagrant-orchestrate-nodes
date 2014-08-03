class classes::repositories {

  case $::osfamily {
    'debian': {
      class { 'apt':
        purge_sources_list_d => true,
      }
      motd::register{ 'Module : apt': }
    }
    'redhat': {
      motd::register{ 'Module : yum': }
    }
    default: {
      fail("Unsupported osfamily ${::osfamily}")
    }
  }
}