class role_orchestrate {
  require ::stack_bootstrap

  class { '::stack_foreman': } ->
  class { '::profile_rundeck': }

  motd::register{ 'Role  : orchestrate': }
}