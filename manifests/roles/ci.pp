node /ci/ {

  class { 'profiles::bootstrap': }
  class { 'profiles::developer': }
  class { 'profiles::jenkinsci': }
  class { 'profiles::php': }

  motd::register{ 'Role : ci': }
}