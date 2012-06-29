# Class: attachmentgenie-motd
#
# This module manages attachmentgenie-motd.
# Currently this is only the module version of the ripienaar/concat example.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   class { 'motd': }
#   motd::register{'Apache': }
class motd {
   include concat::setup
   $motd = "/etc/motd.tail"

   concat{$motd:
      owner => root,
      group => root,
      mode  => 755
   }
   concat::fragment{"motd_puppet_header":
      target => $motd,
      content => "\nPuppet environment: $environment\n",
      order   => 01,
   }

   concat::fragment{"motd_module_header":
      target => $motd,
      content => "\nPuppet modules on this server:\n\n",
      order   => 02,
   }
}