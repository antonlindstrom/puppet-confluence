require 'spec_helper'

describe 'confluence::config' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}
  it { should contain_user('confluence') }
  it { should contain_file('/home/confluence') }
  it { should contain_file('setenv.sh') }
  it { should contain_file('confluence-init.properties') }
end
