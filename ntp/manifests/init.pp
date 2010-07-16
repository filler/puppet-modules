# Class: ntp
#
# This module manages ntp and is included in the generic class
# and applied to all nodes
#
class ntp {
  package { "ntp": }

  file {
    "/etc/ntp.conf":
      owner   => "root",
      group   => "root",
      mode    => "644",
      source  => "puppet:///modules/ntp/ntp.conf",
      require => Package["ntp"],
      links   => follow,
    } # file

  service {
    "ntpd":
      enable    => "true",
      ensure    => "running",
      hasstatus => "true",
      require   => File["/etc/ntp.conf"],
      subscribe => File["/etc/ntp.conf"],
  } # service

} # class ntp
