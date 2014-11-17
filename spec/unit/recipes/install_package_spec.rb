require 'spec_helper'

described_recipe 'znc::install_package' do
  context 'with ubuntu 12.04' do
    it { expect(chef_run).to install_package('znc') }
    it { expect(chef_run).to install_package('znc-dev') }
    it { expect(chef_run).to install_package('znc-extra') }
  end

  context 'with macosx 10.9' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'macosx', version: '10.9').converge(described_recipe)
    end

    it { expect(chef_run).to install_homebrew_package('znc') }
  end
end
