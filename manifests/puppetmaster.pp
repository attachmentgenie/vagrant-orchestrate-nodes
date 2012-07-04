import "default.pp"

#Install applications to provision machines
case $::operatingsystem {
  default: { $provision_packages = ["juju"] }
}

package { $provision_packages:
  ensure  => latest,
  require => Exec["apt_update"],
}