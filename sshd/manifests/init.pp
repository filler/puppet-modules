class sshd {
  case $operatingsystem {
    CentOS: { $ssh_packages = ["openssh", "openssh-server", "openssh-clients"] }
    debian: { $ssh_packages = ["openssh-server", "openssh-client"] }
    default: { $ssh_packages = ["openssh", "openssh-server"] }
  } # end operating system

  package { $ssh_packages: ensure => installed }

  service { sshd:
    name => $operatingsystem ? {
      CentOS => "sshd",
      debian => "ssh",
      default => "sshd",
    }, # end operating system
    enable => true,
    ensure => running
  } # end service

} # end class
