# Encoding: utf-8
#
# Author:: Brian Flad (<bflad417@gmail.com>)
# Cookbook Name:: yum
# Attributes:: epel-testing
#
# Copyright 2013, Opscode, Inc.
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

case node['platform']
when 'amazon'
  default['yum']['epel-testing']['url'] = 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-testing6&arch=$basearch'
  default['yum']['epel-testing']['baseurl'] = ''
else
  default['yum']['epel-testing']['url'] = "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-testing#{node['platform_version'].to_i}&arch=$basearch"
  default['yum']['epel-testing']['baseurl'] = ''
end

default['yum']['epel-testing']['includepkgs'] = nil
default['yum']['epel-testing']['exclude'] = nil
