class role_git {
  require ::stack_bootstrap

  class { '::stack_gitlab': }

  motd::register{ 'Role  : git': }
}