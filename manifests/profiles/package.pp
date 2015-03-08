class profiles::package {

  require profiles::developer

  package { 'fpm':
    ensure   => 'latest',
    provider => 'gem',
  }

  motd::register{ 'Profile : package': }
}