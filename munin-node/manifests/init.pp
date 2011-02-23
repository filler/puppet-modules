# Class: munin-node
#
# This module manages munin-node and is included in the generic class
# and applied to all nodes
#
class munin-node {
  package { 
    "munin-node": 
      ensure => present,
  } # package

  file {
    "munin-node.conf":
      owner     => "root",
      group     => "root",
      mode      => "644",
      require   => Package["munin-node"],
      path      => "/etc/munin/munin-node.conf",
      content   => template("munin-node/munin-node.conf.erb"),
  } # file

  service {
    "munin-node":
      enable    => "true",
      ensure    => "running",
      hasstatus => "true",
      pattern   => "munin-node",
      require   => "munin-node.conf",
      subscribe => "munin-node.conf",
  } # service

} # class munin-node
