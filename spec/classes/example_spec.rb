require 'spec_helper'

describe 'freebsd_newsyslog' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "freebsd_newsyslog class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('freebsd_newsyslog::params') }
        it { should contain_class('freebsd_newsyslog::install').that_comes_before('freebsd_newsyslog::config') }
        it { should contain_class('freebsd_newsyslog::config') }
        it { should contain_class('freebsd_newsyslog::service').that_subscribes_to('freebsd_newsyslog::config') }

        it { should contain_service('freebsd_newsyslog') }
        it { should contain_package('freebsd_newsyslog').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'freebsd_newsyslog class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('freebsd_newsyslog') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
