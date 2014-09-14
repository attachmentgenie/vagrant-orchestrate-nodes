class classes::time {

  class { 'ntp': }
  class { 'timezone':
    zone => 'Europe/Amsterdam',
  }
}