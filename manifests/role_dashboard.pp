class roles::dashboard {
  require ::stack_bootstrap

  motd::register{ 'Role : dashboard': }
}