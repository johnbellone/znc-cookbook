require 'spec_helper'

described_recipe 'znc::install_source' do
  it do
    expect(chef_run).to configure_ark('znc')
  end

  it do
    expect(chef_run).to install_with_make_ark('znc')
  end
end
