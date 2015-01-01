require 'spec_helper'

describe_recipe 'znc::_package' do
  context %Q(node['platform'] = 'ubuntu' AND node['platform_version'] = '12.04') do
    it { expect(chef_run).to install_package('znc') }
    it { expect(chef_run).to install_package('znc-dev') }
    it { expect(chef_run).to install_package('znc-extra') }
  end

  context %Q(node['platform'] = 'mac_os_x' AND node['platform_version'] = '10.9.2') do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'mac_os_x', version: '10.9.2').converge(described_recipe)
    end
    it { expect(chef_run).to install_package('znc') }
  end
end
