#
# Cookbook Name:: hipchat_client
# Recipe:: default
#
# Copyright 2013, Urbandecoder Labs LLC
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

case node['platform_family']
  when 'mac_os_x'
    include_recipe 'hipchat_client::_mac_os_x'
  when 'windows'
    include_recipe 'hipchat_client::_windows'
end

case node['kernel']['name']
  when 'Linux'
    include_recipe 'hipchat_client::linux'
end
