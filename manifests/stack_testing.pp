class stack_testing {
  class { '::profile_jenkins': }
  class { '::profile_ruby': } ->
  class { '::profile_package': }
  class { '::profile_php': }

  motd::register{ 'Stack : testing': }
}
