# == Class graphite_powershell::config
#
# This private class is called from `graphite_powershell`
# It manages the graphite stats config files
#
class graphite_powershell::config {

  file { 'C:/GraphitePowershell/StatsToGraphiteConfig.xml':
    ensure  => present,
    owner   => 'SYSTEM',
    content => template('graphite_powershell/StatsToGraphiteConfig.xml.erb'),
    notify  => Service['GraphitePowerShell'],
  }
}
