class profile_package {

  require ::profile_ruby

  package { 'fpm':
    ensure   => 'latest',
    provider => 'gem',
  }

  motd::register{ 'Profile : package': }
}