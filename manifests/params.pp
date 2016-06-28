# == Class graphite_powershell::params
#
# This private class is meant to be called from `graphite_powershell`
# It sets variables according to platform
#
class graphite_powershell::params {
  $powershell = 'C:\\Windows\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe -ExecutionPolicy RemoteSigned'

  $install_url = 'https://raw.githubusercontent.com/MattHodge/Graphite-PowerShell-Functions/master/Graphite-PowerShell.ps1'
  $install_dir = 'C:/GraphitePowershell'

  $port = '2003'
  $metric_path = 'performance.windows'
  $metric_send_interval = '10'
  $timezone = 'UTC'
  $verbose_logging = true

  $performance_counters = [
    '\Network Interface(*)\Bytes Received/sec',
    '\Network Interface(*)\Bytes Sent/sec',
    '\Network Interface(*)\Packets Received Unicast/sec',
    '\Network Interface(*)\Packets Sent Unicast/sec',
    '\Network Interface(*)\Packets Received Non-Unicast/sec',
    '\Network Interface(*)\Packets Sent Non-Unicast/sec',
    '\Processor(_Total)\% Processor Time',
    '\Memory\Available MBytes',
    '\Memory\Pages/sec',
    '\Memory\Pages Input/sec',
    '\System\Processor Queue Length',
    '\System\Threads',
    '\PhysicalDisk(*)\Avg. Disk Write Queue Length',
    '\PhysicalDisk(*)\Avg. Disk Read Queue Length'
  ]

  $metric_filters = [ 'isatap', 'teredo tunneling' ]
}
