#
# Cookbook Name:: znc
# Recipe:: module_colloquy
#
# Copyright (c) 2011-2013, Seth Chisamore
# Copyright (c) 2014, John Bellone <jbellone@bloomberg.net>
# Copyright (c) 2014, Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
module_dir = ::File.join(node['znc']['data_dir'], 'modules')
directory module_dir do
  recursive true
  owner node['znc']['user']
  group node['znc']['group']
  not_if { ::Dir.exist?(module_dir) }
end

remote_file "#{Chef::Config[:file_cache_path]}/colloquy.cpp" do
  source "https://github.com/wired/colloquypush/raw/master/znc/colloquy.cpp"
  mode "0644"
  not_if { ::File.exists?("#{node['znc']['module_dir']}/colloquy.so")}
end

bash "znc-buildmod colloquy.cpp && mv colloquy.so #{module_dir}/" do
  cwd Chef::Config[:file_cache_path]
  creates ::File.join(module_dir, 'colloquy.so')
  notifies :restart, 'service[znc]', :delayed
end
