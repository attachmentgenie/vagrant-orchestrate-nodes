class profile_locale {

  case $::osfamily {
    'debian': {
      class { 'locales': }
    }
  }

  motd::register{ 'Profile : locale': }
}