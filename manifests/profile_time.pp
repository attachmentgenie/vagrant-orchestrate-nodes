class profile_time {

  class { 'ntp': }
  class { 'timezone':
    zone => 'Europe/Amsterdam',
  }
}