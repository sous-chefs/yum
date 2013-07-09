#
# Cookbook Name:: yum
# Attributes:: epel
#
# Copyright 2011, Eric G. Wolfe
# Copyright 2011, Opscode, Inc.
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
when "amazon"
  default['yum']['epel']['url'] = "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch"
  default['yum']['epel']['baseurl'] = ""
  default['yum']['epel']['key'] = "RPM-GPG-KEY-EPEL-6"
when "fedora"
  default['yum']['epel']['url'] = "http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-#{node['platform_version'].to_i}&arch=$basearch"
  default['yum']['epel']['baseurl'] = ""

  if node['platform_version'].to_i = 19
    default['yum']['epel']['key'] = "RPM-GPG-KEY-fedora-19-primary"
    default['yum']['epel']['key_url'] = "https://fedoraproject.org/static/FB4B18E6.txt"
  elsif node['platform_version'].to_i = 18
    default['yum']['epel']['key'] = "RPM-GPG-KEY-fedora-18-primary"
    default['yum']['epel']['key_url'] = "https://fedoraproject.org/static/DE7F38BD.txt"
  else
    default['yum']['epel']['key'] = ""
  end
else
  default['yum']['epel']['url'] = "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-#{node['platform_version'].to_i}&arch=$basearch"
  default['yum']['epel']['baseurl'] = ""

  if node['platform_version'].to_i >= 6
    default['yum']['epel']['key'] = "RPM-GPG-KEY-EPEL-6"
  else
    default['yum']['epel']['key'] = "RPM-GPG-KEY-EPEL"
  end
end

default['yum']['epel']['key_url'] = "http://dl.fedoraproject.org/pub/epel/#{node['yum']['epel']['key']}" if default['yum']['epel']['key_url'].nil? || default['yum']['epel']['key_url'].empty?
default['yum']['epel']['includepkgs'] = nil
default['yum']['epel']['exclude'] = nil
