class stack_bootstrap (
  $monitor_node = true,
) {

  class { '::motd': }
  class { '::profile_icinga': }
  class { '::profile_firewall': }
  class { '::profile_rsyslog_client': }
  class { '::profile_locale': }
  class { '::profile_network': }
  class { '::profile_repositories': }
  class { '::profile_ssh': }
  class { '::profile_sudo': }
  class { '::profile_time': }

  motd::register{ 'Stack : bootstrap': }
}
