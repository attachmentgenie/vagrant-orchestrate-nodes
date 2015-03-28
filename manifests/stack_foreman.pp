class stack_foreman () {

  class { '::profile_puppetdb': }
  class { '::profile_puppetmaster': }

  motd::register{ 'Stack : foreman': }
}