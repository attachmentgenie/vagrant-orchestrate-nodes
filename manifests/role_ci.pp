class role_ci {
  require ::stack_bootstrap

  class { '::stack_testing': }

  motd::register{ 'Role  : ci': }
}