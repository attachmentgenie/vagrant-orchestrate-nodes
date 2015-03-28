class profile_firewall (
  $ensure = 'running',
) {
  class { 'firewall':
    ensure => $ensure,
  }

  motd::register{ 'Profile : firewall': }
}