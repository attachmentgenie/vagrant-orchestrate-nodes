class role_monitor {
  require ::stack_bootstrap

  motd::register{ 'Role : monitor': }
}