class roles::monitor {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : monitor': }
}