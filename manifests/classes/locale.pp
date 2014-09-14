class classes::locale {

  case $::osfamily {
    'debian': {
      class { 'locales': }
    }
  }
}