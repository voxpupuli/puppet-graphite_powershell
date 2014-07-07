# == Class: graphite_powershell
#
# Full description of class graphite_powershell here.
#
# === Parameters
#
class graphite_powershell (
  $server,
  $install_url          = $graphite_powershell::params::install_url,
  $install_dir          = $graphite_powershell::params::install_dir,
  $port                 = $graphite_powershell::params::port,
  $metric_path          = $graphite_powershell::params::metric_path,
  $metric_send_interval = $graphite_powershell::params::metric_send_interval,
  $timezone             = $graphite_powershell::params::timezone,
  $performance_counters = $graphite_powershell::params::performance_counters,
  $metric_filters       = $graphite_powershell::params::metric_filters,
  $verbose_logging      = $graphite_powershell::params::verbose_logging
) inherits graphite_powershell::params {

  if $::osfamily != 'windows' {
    fail("${::osfamily} not supported")
  }

  validate_string($server)
  validate_string($install_url)
  validate_absolute_path($install_dir)
  validate_re($port, '^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$')
  validate_string($metric_path)
  validate_re($metric_send_interval, '\d+')
  validate_string($timezone)
  validate_array($performance_counters)
  validate_array($metric_filters)
  validate_bool($verbose_logging)

  anchor { 'graphite_powershell::begin': } ->
  class { 'graphite_powershell::config': } ->
  class { 'nssm': } ->
  class { 'graphite_powershell::install': } ->
  class { 'graphite_powershell::service': } ->
  anchor { 'graphite_powershell::end': }
}
