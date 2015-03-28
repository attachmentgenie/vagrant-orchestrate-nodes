class profile_time (
  $restrict = [],
  $zone     = 'Europe/Amsterdam',
) {

  class { 'ntp':
    restrict => $restrict,
  }
  class { 'timezone':
    zone     => $zone,
  }

  motd::register{ 'Profile : time': }
}