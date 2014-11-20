#
# Cookbook Name:: znc
# Recipe:: package
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
include_recipe 'chef-sugar::default'

case node['platform']
when 'macosx'
  # This cookbook prior did not support installing on Mac systems. If
  # someone is using Chef 12 (or later) they can use this LWRP to
  # install with the homebrew package manager.
  if chef_version.satisfies?('~> 12.0')
    homebrew_package 'znc'
  end
else
  package 'znc'
  package 'znc-dev'
  package 'znc-extra'
end
