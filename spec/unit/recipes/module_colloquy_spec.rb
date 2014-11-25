require 'spec_helper'

described_recipe 'znc::module_colloquy' do
  let(:module_dir) { '/var/lib/znc/modules' }

  it do
    expect(chef_run).to create_directory(module_dir)
      .with(recursive: true)
      .with(owner: 'znc')
      .with(group: 'znc')
  end

  it do
    expect(chef_run).to create_remote_file(File.join(Chef::Config[:file_cache_path], 'colloquy.cpp'))
      .with(source: 'https://github.com/wired/colloquypush/raw/master/znc/colloquy.cpp')
      .with(mode: '0644')
  end

  it do
    expect(chef_run).to run_bash(%Q(znc-buildmod colloquy.cpp && mv colloquy.so #{module_dir}/))
      .with(cwd: Chef::Config[:file_cache_path])
      .with(creates: File.join(module_dir, 'colloquy.so'))
  end
end
