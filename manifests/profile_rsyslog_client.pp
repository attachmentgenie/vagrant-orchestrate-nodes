class profile_rsyslog_client {

  class { 'rsyslog::client': }

  motd::register{ 'Profile : rsyslog_client': }
}