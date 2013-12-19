require 'spec_helper'

describe 'confluence::service' do
  describe 'confluence::service class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_service('confluence') }
  end

  describe 'confluence::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('confluence') }
  end
end

