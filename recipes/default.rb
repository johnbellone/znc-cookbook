#
# Cookbook Name:: znc
# Recipe:: default
#
# Copyright (c) 2011-2013, Seth Chisamore
# Copyright (c) 2014, John Bellone
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

include_recipe "znc::install_#{node['znc']['install_method']}"

group node['znc']['group']
user node['znc']['user'] do
  gid node['znc']['group']
end

directory node['znc']['data_dir'] do
  recursive true
  user node['znc']['user']
  group node['znc']['group']
end

template '/etc/init.d/znc' do
  source 'znc.init.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

ssl_certificate 'znc' do
  namespace node['znc']['ssl_certificate']
  cert_dir node['znc']['data_dir']
  notifies :restart, 'service[znc]', :delayed
end

template "#{node['znc']['data_dir']}/configs/znc.conf" do
  source 'znc.conf.erb'
  mode '0600'
  owner node['znc']['user']
  group node['znc']['group']
  variables(users: users)
  notifies :restart, 'service[znc]', :delayed
end

service 'znc' do
  supports restart: true
  action :nothing
end
