#
# Cookbook Name:: znc
# Attribute:: source
#
# Copyright (c) 2011-2013, Seth Chisamore
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

default['znc']['url'] = "http://znc.in/releases"
default['znc']['version'] = "1.0"
default['znc']['checksum'] = "a85539da42697b26e4d46205def36bb799f83d6aeef401d53c49ee674142062a"
default['znc']['configure_options'] = %W{ --enable-extra }
