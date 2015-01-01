#
# Cookbook Name:: znc
# Attributes:: default
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
default['znc']['install_method'] = 'package'

default['znc']['user'] = 'znc'
default['znc']['group'] = 'znc'
default['znc']['skin'] = 'dark-clouds'
default['znc']['port'] = '7777'
default['znc']['max_buffer_size'] = 500
default['znc']['modules'] = %w(webadmin adminlog)
default['znc']['data_dir'] = '/var/lib/znc'
default['znc']['data_bag'] = 'znc_users'

default['znc']['source']['path'] = nil
default['znc']['source']['url'] = "http://znc.in/releases/znc-%{version}.tar.gz"
default['znc']['source']['checksum'] = '86e98fd0ed182d39828c926809f8075d836ee3b70a6dd43dfbb434822f2a7b52'
default['znc']['source']['version'] = '1.4'
default['znc']['source']['configure_options'] = %w(--enable-extra)
default['znc']['source']['make_options'] = []

default['znc']['ssl_certificate']['common_name'] = ''
default['znc']['ssl_certificate']['country'] = 'US'
default['znc']['ssl_certificate']['city'] = 'Washington D.C.'
default['znc']['ssl_certificate']['organization'] = 'Bloomberg L.P.'
default['znc']['ssl_certificate']['department'] = 'Web Operations'
default['znc']['ssl_certificate']['email'] = 'webops@bloomberg.net'
default['znc']['ssl_certificate']['years'] = 1

if node['platform'] == 'macosx'
  default['znc']['data_dir'] = '$HOME/.znc'
end
