require 'spec_helper'
describe 'openstack_cloud' do

  context 'with defaults for all parameters' do
    it { should contain_class('openstack_cloud') }
  end
end
