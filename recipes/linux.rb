#
# Cookbook Name:: hipchat_client
# Recipe:: linux
#
# Copyright 2014, Jackl0phty LLC.
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
  when 'debian'

  # Install BASH shell.
  include_recipe 'unix_shells::bash'

  # Install Hipchat client for Debian-based distros.
  # Note: Officially supports Ubuntu, Kubuntu, Mint, & Debian.
  bash "Installing Hipchat client for Linux..." do
    user "root"
    cwd "/tmp"
    code <<-EOH
    echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list
    /etc/apt/sources.list.d/atlassian-hipchat.list
    wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
    apt-get update
    apt-get hipchat
    EOH
    not_if 'cat /etc/apt/sources.list.d/atlassian-hipchat.list |grep hipchat'
    not_if 'which hipchat'
  end

end
