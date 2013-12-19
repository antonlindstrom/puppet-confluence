require 'spec_helper'

describe 'confluence::install' do
  describe 'confluence::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_class('java7') }
    it { should contain_class('wget') }
    it { should contain_wget__fetch('download_confluence') }
    it { should contain_exec('extract_confluence') }
    it { should contain_file('/opt') }
    it { should contain_file('/etc/init.d/confluence') }
  end

  describe 'confluence::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_class('java7') }
    it { should contain_class('wget') }
    it { should contain_wget__fetch('download_confluence') }
    it { should contain_exec('extract_confluence') }
    it { should contain_file('/opt') }
    it { should contain_file('/etc/init.d/confluence') }
  end
end
