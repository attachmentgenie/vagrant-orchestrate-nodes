class role_orchestrate {

  # chicken and egg problem regarding icinga so turning on for now.
  #require ::stack_bootstrap
  class { '::stack_foreman': }

  motd::register{ 'Role  : orchestrate': }
}