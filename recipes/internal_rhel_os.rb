#
# Author:: Sean OMeara (<someara@opscode.com>)
# Cookbook Name:: yum
# Recipe:: internal_rhel_os
#
# Copyright:: Copyright (c) 2013 Opscode, Inc.

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


file "/etc/yum.repos.d/CentOS-Base.repo" do
  action :delete
end

file "/etc/yum.repos.d/CentOS-Debuginfo.repo" do
  action :delete
end

file "/etc/yum.repos.d/CentOS-Media.repo" do
  action :delete
end

file "/etc/yum.repos.d/CentOS-Vault.repo" do
  action :delete
end

##

yum_key node['yum']['internal_rhel_os']['key'] do
  url  node['yum']['internal_rhel_os']['key_url']
  action :add
end

yum_repository "internal_rhel_os" do
  description "Local yum mirror of Enterprise Linux"
  url node['yum']['internal_rhel_os']['url']
  key node['yum']['internal_rhel_os']['key']
end

