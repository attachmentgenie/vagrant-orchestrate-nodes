class stack_pulp {
  class { 'pulp': }               # Install pulp v2 yum repo
  class { 'pulp::server': }       # Install pulp server
  class { 'pulp::admin_client': } # Install admin client
  class { 'pulp::consumer': }     # Install pulp agent and client

  motd::register{ 'Stack : pulp': }
}