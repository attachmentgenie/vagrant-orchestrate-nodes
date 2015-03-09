class roles::ci {

  class { 'profiles::bootstrap': }
  class { 'profiles::developer': }
  class { 'profiles::jenkinsci': }
  class { 'profiles::package': }
  class { 'profiles::php': }

  motd::register{ 'Role : ci': }
}