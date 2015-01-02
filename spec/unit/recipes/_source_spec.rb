require 'spec_helper'

describe_recipe 'znc::_source' do
  it { expect(chef_run).to configure_ark('znc') }
  it { expect(chef_run).to install_with_make_ark('znc') }
end
