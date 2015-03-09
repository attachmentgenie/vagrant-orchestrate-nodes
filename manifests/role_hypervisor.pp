class roles::hypervisor {

  require ::stack_bootstrap
  class { '::stack_openstack': }

  motd::register{ 'Role : hypervisor': }
}