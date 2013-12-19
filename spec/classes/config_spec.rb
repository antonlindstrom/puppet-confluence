require 'spec_helper'

describe 'confluence::config' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}
  it { should contain_user('confluence') }
  it { should contain_file('/home/confluence') }
  it { should contain_file('setenv.sh') }
end
