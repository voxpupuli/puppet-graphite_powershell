# == Class graphite_powershell::install
#
# This class is meant to be called from graphite_powershell
#
class graphite_powershell::install {

  download_file { 'graphite_ps-install':
    url                    => $graphite_powershell::install_url,
    destination_directory  => $graphite_powershell::install_dir
  }

  file { "${graphite_powershell::install_dir}/Graphite-PowerShell.ps1":
    ensure  => present,
    owner   => 'SYSTEM',
    notify  => Service['GraphitePowerShell'],
    require => Download_file['graphite_ps-install']
  }

  exec { 'install-graphite_powershell':
    command   => "${graphite_powershell::params::powershell} -Command \"Start-Process -FilePath C:\\Program Files\\nssm.exe -ArgumentList \'install GraphitePowerShell \"${graphite_powershell::params::powershell}\" \"-command \"& { . ${graphite_powershell::install_dir}\\Graphite-PowerShell.ps1; Start-StatsToGraphite }\"\" \' -NoNewWindow -Wait\"",
    onlyif    => "${graphite_powershell::params::powershell} -Command \"if (Get-Service \\\"GraphitePowershell\\\" -ErrorAction SilentlyContinue) { exit 1 } else {exit 0 }\"",
    logoutput => true,
    require   => File["${graphite_powershell::install_dir}\\Graphite-PowerShell.ps1"]
  }
}
