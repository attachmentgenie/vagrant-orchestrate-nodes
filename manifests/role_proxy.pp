class roles::proxy {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : proxy': }
}