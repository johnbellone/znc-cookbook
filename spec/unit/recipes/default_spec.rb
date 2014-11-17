require 'spec_helper'

described_recipe 'znc::default' do
  it { expect(chef_run).to include_recipe 'znc::install_package' }
  it { expect(chef_run).to create_group('znc') }
  it do
    expect(chef_run).to create_user('znc')
      .with(gid: 'znc')
  end
  it do
    expect(chef_run).to create_directory('/var/lib/znc')
      .with(owner: 'znc')
      .with(group: 'znc')
      .with(recursive: true)
  end
  it do
    expect(chef_run).to create_directory('/var/lib/znc/configs')
      .with(owner: 'znc')
      .with(group: 'znc')
  end
  it do
    expect(chef_run).to create_template('/etc/init.d/znc')
      .with(owner: 'root')
      .with(group: 'root')
      .with(mode: '0755')
  end
  it do
    expect(chef_run).to create_template('/var/lib/znc/configs/znc.conf')
      .with(owner: 'znc')
      .with(group: 'znc')
      .with(mode: '0600')
  end
end
