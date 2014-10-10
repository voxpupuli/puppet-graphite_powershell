# Author::    Liam Bennett (mailto:lbennett@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class graphite_powershell::service
#
# This private class is meant to be called from `graphite_powershell`
# It ensure the service is running
#
class graphite_powershell::service {

  service { 'GraphitePowerShell':
    ensure  => running,
    enable  => true
  }
}
