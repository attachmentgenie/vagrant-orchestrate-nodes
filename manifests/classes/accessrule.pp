define classes::accessrule (
  $action = 'accept',
  $port = undef,
  $proto = 'tcp',
) {

  resources { "firewall":
    purge => true
  }
  case $::osfamily {
    'debian': {
    }
    'redhat': {
      firewall {$name:
        dport  => $port,
        proto  => $proto,
        action => $action,
        state  => 'NEW',
      }
    }
    default: {
      fail("Unsupported osfamily ${::osfamily}")
    }
  }
}