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

bash "generate-pem" do
  cwd node['znc']['data_dir']
  code <<-EOH
  umask 077
  openssl genrsa 2048 > znc.key
  openssl req -subj /C=US/ST=Several/L=Locality/O=Example/OU=Operations/CN=#{node['fqdn']}/emailAddress=znc@#{node['fqdn']} \
   -new -x509 -nodes -sha1 -days 3650 -key znc.key > znc.crt
  cat znc.key znc.crt > znc.pem
  EOH
  user node['znc']['user']
  group node['znc']['grouip']
  creates "#{node['znc']['data_dir']}/znc.pem"
end

template '/etc/init.d/znc' do
  source 'znc.init.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template "#{node['znc']['data_dir']}/configs/znc.conf" do
  source 'znc.conf.erb'
  mode '0600'
  owner node['znc']['user']
  group node['znc']['group']
  variables(
    :users => users
  )

  notifies :start, 'service[znc]', :delayed
end

service 'znc' do
  supports restart: true
  action :nothing
end
