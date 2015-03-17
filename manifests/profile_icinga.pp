class profile_icinga (
  $is_server   = false,
) {
  stage { 'before':
    before => Stage['main'],
  }
  class { '::repoforge':
    enabled => ['rpmforge'],
    stage   => before,
  }
  class { '::epel':
    stage => before,
  }
  if str2bool($is_server) {
    class { '::apache': }
  }
  class {
    'icinga':
      icinga_vhost => '/etc/httpd/conf.d/15-icinga.conf',
      server       => $is_server,
      plugins      => [ 'checkpuppet', 'pnp4nagios' ],
  }

  Nagios_service {
    host_name           => $::fqdn,
    use                 => 'generic-service',
    notification_period => '24x7',
    target              => "${::icinga::targetdir}/services/${::fqdn}.cfg",
    action_url          => '/pnp4nagios/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',
  }
}