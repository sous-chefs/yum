#
# Author:: Chris Petersen (<geek@ex-nerd.com>)
# Cookbook Name:: yum
# Recipe:: webtatic
#
# Copyright:: Copyright (c) 2013
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

if platform?("amazon")
  major = '6'
else
  major = node['platform_version'].to_i
end

if node['kernel']['machine'] == "i686" && major == 5
  arch = "i386"
else
  arch = node['kernel']['machine']
end


#webtatic = "#{major}-#{node['yum']['webtatic_release']}"
webtatic = "#{major}-2"
package  = "webtatic-release-#{webtatic}.noarch.rpm"

remote_file "#{Chef::Config[:file_cache_path]}/#{package}" do
  if major == 5
    source "http://repo.webtatic.com/yum/centos/#{major}/#{arch}/#{package}"
  else
    source "http://repo.webtatic.com/yum/el#{major}/#{arch}/#{package}"
  end
  not_if "rpm -qa | grep -q '^webtatic-release-#{webtatic}'"
  notifies :install, "rpm_package[webtatic-release]", :immediately
end

rpm_package "webtatic-release" do
  source "#{Chef::Config[:file_cache_path]}/#{package}"
  only_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/#{package}") }
  action :install
end

file "webtatic-release-cleanup" do
  path "#{Chef::Config[:file_cache_path]}/#{package}"
  action :delete
end
