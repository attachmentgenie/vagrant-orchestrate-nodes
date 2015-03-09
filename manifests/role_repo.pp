class role_repo {

  require ::stack_bootstrap
  class { '::stack_pulp': }

  motd::register{ 'Role : repo': }
}