class classes::log_client {

  class { 'rsyslog::client': }
  motd::register{ 'Module : rsyslog': }
}