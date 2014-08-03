class classes::locale {

  case $::osfamily {
    'debian': {
      class { 'locales': }
      motd::register{ 'Module : locales': }
    }
  }
}