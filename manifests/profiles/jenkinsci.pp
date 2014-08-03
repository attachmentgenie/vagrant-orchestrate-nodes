class profiles::jenkinsci {

  class { 'jenkins':
    configure_firewall => false,
  }
  classes::accessrule { '999 accept 8080':
    port => 8080,
  }
  motd::register{ 'Module : jenkins': }
}