class role_node {
  require ::stack_bootstrap

  class { '::stack_website': }

  motd::register{ 'Role  : node': }
}