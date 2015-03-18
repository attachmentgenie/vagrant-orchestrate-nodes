class role_orchestrate {

  require ::stack_bootstrap
  class { '::stack_foreman': }

  motd::register{ 'Role  : orchestrate': }
}