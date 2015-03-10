class stack_website {
  class { '::apache': }

  motd::register{ 'Stack : website': }
}