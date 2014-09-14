node /proxy/ {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : proxy': }
}