class stack_pulp {
  class { '::pulp::server': }

  motd::register{ 'Stack : pulp': }
}