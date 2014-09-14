node /orchestrate/ {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : orchestrate': }
}