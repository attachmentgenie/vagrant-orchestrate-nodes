class roles::log {
  require ::stack_bootstrap

  motd::register{ 'Role : log': }
}