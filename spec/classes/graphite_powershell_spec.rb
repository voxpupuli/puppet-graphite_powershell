require 'spec_helper'

describe 'graphite_powershell' do
  context 'supported operating systems' do
    ['windows'].each do |osfamily|
      describe "graphite_powershell class without any parameters on #{osfamily}" do
        let(:params) {{
          :server => 'localhost'
        }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        #it { should compile.with_all_deps }

        it { should contain_class('graphite_powershell::params') }
        it { should contain_class('nssm') }
        it { should contain_class('graphite_powershell::config').that_comes_before('nssm') }
        it { should contain_class('graphite_powershell::install').that_comes_before('graphite_powershell::service') }
        it { should contain_class('graphite_powershell::service') }

        it { should contain_service('GraphitePowerShell').that_subscribes_to('File[C:/GraphitePowershell/StatsToGraphiteConfig.xml]') }

        it { should contain_file('C:/GraphitePowershell/Graphite-PowerShell.ps1').with_ensure('present') }

        it { should contain_file('C:/GraphitePowershell/StatsToGraphiteConfig.xml').with_ensure('present') }

      end
    end
  end

  context 'unsupported operating system' do
    describe 'graphite_powershell class without any parameters on Debian/Ubuntu' do
      let(:params) {{
        :server => 'localhost'
      }}
      let(:facts) {{
        :osfamily        => 'Debian',
        :operatingsystem => 'Ubuntu',
      }}

      it { expect { should contain_file('C:/GraphitePowershell/StatsToGraphiteConfig.xml') }.to raise_error(Puppet::Error, /Debian not supported/) }
    end
  end
end
