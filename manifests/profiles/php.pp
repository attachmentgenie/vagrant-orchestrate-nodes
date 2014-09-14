class profiles::php {

  case $::osfamily {
    'Debian': {

    }
    'RedHat': {
      yumrepo {'webtatic' :
      mirrorlist => 'http://mirror.webtatic.com/yum/el6/$basearch/mirrorlist',
      descr      => 'Webtatic',
      enabled    => 1,
      gpgcheck   => 1,
      }
    }
    default: {
      fail("No repo available for ${::osfamily}/${::operatingsystem}, please fork this module and add one in repo.pp")
    }
  }
  class { '::php':
    manage_repos => false,
    fpm          => false,
    composer     => false,
    extensions   => {'xml'    => {'package_prefix' => 'php56w-'},
                     'intl'   => {'package_prefix' => 'php56w-'},
                     'mysql'  => {'package_prefix' => 'php56w-'},
                     'mcrypt' => {'package_prefix' => 'php56w-'},
                     'xdebug' => {'package_prefix' => 'php56w-pecl-'}},
    settings     => {'Date/date.timezone' => 'Europe/Amsterdam'},
  } ->
  class { 'composer':
    target_dir      => '/usr/bin',
    suhosin_enabled => false,
  }

  motd::register{ 'Profile : php': }
}