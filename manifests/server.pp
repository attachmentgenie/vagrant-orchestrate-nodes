  import 'client.pp'

  #Install applications to provision machines
  case $::operatingsystem {
    default: { $provision_packages = ['juju'] }
  }

  package { $provision_packages:
    ensure  => latest,
    require => Exec['apt_update'],
  }
  
  case $::operatingsystem {
    default: { $gem_packages = ['librarian-puppet'] }
  }

  package { $gem_packages:
    provider => gem,
    ensure   => latest,
  }
