# Class: munin-node
#
# This module manages munin-node and is included in the generic class
# and applied to all nodes
#
class munin-node {
  package { "munin-node": }

  service {
    "munin-node":
      enable    => "true",
      ensure    => "running",
      hasstatus => "true",
  } # service

} # class munin-node

