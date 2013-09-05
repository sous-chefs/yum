#
# Author:: Sean OMeara (<someara@opscode.com>)
# Cookbook Name:: yum
# Recipe:: internal
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

yum_key node['yum']['internal_rhel_epel']['key'] do
  url  node['yum']['internal_rhel_epel']['key_url']
  action :add
end

yum_repository "internal_rhel_epel" do
  description "Local yum mirror of Fedora EPEL"
  url node['yum']['internal_rhel_epel']['url']
  key node['yum']['internal_rhel_epel']['key']
end

