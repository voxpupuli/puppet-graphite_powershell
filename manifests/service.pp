# == Class graphite_powershell::service
#
# This class is meant to be called from graphite_powershell
# It ensure the service is running
#
class graphite_powershell::service {

  service { 'GraphitePowerShell':
    ensure  => running,
    enable  => true
  }
}
