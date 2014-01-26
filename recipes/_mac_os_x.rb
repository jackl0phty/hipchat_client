#
# Cookbook Name:: hipchat_client
# Recipe:: mac_os_x
#
# Copyright 2013, Urbandecoder Labs
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

remote_file "#{Chef::Config[:file_cache_path]}/HipChat-2.4.zip" do
  source 'https://downloads.hipchat.com.s3.amazonaws.com/osx/HipChat-2.4.zip'
  checksum '93391567ecbf6982e1a6092fd9ac1b32ae1af5a6aa7eabd05555cfb31e438d9e'
  notifies :run, 'execute[unzip-hipchat]'
end

execute 'unzip-hipchat' do
  command "unzip #{Chef::Config[:file_cache_path]}/HipChat-2.4.zip -d /Applications"
  action :nothing
end
