# == Class graphite_powershell::config
#
# This class is called from graphite_powershell
#
class graphite_powershell::config {

  file { 'C:/GraphitePowershell/StatsToGraphiteConfig.xml':
    ensure  => present,
    owner   => 'SYSTEM',
    content => template('graphite_powershell/StatsToGraphiteConfig.xml.erb'),
    notify  => Service['GraphitePowerShell'],
  }
}
