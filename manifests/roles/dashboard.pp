node /dashboard/ {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : dashboard': }
}