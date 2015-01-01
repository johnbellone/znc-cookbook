require 'spec_helper'

describe_recipe 'znc::default' do
  it do
    method = chef_run.node['znc']['install_method']
    expect(chef_run).to include_recipe("znc::_#{method}")
  end
  it { expect(chef_run).to create_group('znc') }
  it do
    expect(chef_run).to create_user('znc')
      .with(gid: 'znc')
  end
  it do
    expect(chef_run).to create_directory('/var/lib/znc/configs')
      .with(recursive: true)
      .with(owner: 'znc')
      .with(group: 'znc')
  end
  it do
    expect(chef_run).to create_directory('/var/lib/znc/modules')
      .with(recursive: true)
      .with(owner: 'znc')
      .with(group: 'znc')
  end
  it do
    expect(chef_run).to create_template('/etc/init.d/znc')
      .with(owner: 'root')
      .with(group: 'root')
      .with(mode: '0755')
  end
  it { expect(chef_run.service('znc')).to do_nothing }
  it do
    expect(chef_run).to create_template('/var/lib/znc/configs/znc.conf')
      .with(owner: 'znc')
      .with(group: 'znc')
      .with(mode: '0600')
  end
end
