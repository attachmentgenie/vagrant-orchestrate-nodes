class roles::log {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : log': }
}