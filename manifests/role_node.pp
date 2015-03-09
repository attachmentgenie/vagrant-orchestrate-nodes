class roles::node {

  class { 'profiles::bootstrap': }

  motd::register{ 'Role : node': }
}