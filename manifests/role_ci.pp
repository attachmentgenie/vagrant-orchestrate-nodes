class role_ci {
  require ::stack_bootstrap

  class { 'profiles::developer': }
  class { 'profiles::jenkinsci': }
  class { 'profiles::package': }
  class { 'profiles::php': }

  motd::register{ 'Role : ci': }
}