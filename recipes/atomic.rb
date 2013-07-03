#
# Author:: Panagiotis Papadomitsos (<pj@ezgr.net>)
# Cookbook Name:: yum
# Recipe:: atomic
#
# Copyright:: Copyright (c) 2011 Opscode, Inc.
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

include_recipe "yum::epel"

yum_key node['yum']['atomic']['key'] do
  url  node['yum']['atomic']['key_url']
  action :add
end

yum_repository "atomic" do
  description "CentOS / Red Hat Enterprise Linux $releasever - atomicrocketturtle.com - $basearch"
  key node['yum']['atomic']['key']
  mirrorlist node['yum']['atomic']['url']
  failovermethod "priority"
  includepkgs node['yum']['atomic']['includepkgs']
  exclude node['yum']['atomic']['exclude']
  action :create
end
