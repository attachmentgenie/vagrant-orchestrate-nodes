class classes::time {

  class { 'ntp': }
  motd::register{ 'Module : ntp': }

  class { 'timezone':
    zone => 'Europe/Amsterdam',
  }
  motd::register{ 'Module : timezone': }
}