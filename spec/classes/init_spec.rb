require 'spec_helper'

describe 'confluence' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "confluence class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('confluence::params') }

        it { should contain_class('confluence::install') }
        it { should contain_class('confluence::config') }
        it { should contain_class('confluence::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'confluence class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
