class role_proxy {
  require ::stack_bootstrap

  class { '::profile_haproxy': }

  motd::register{ 'Role  : proxy': }
}