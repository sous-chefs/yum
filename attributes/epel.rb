#
# Cookbook Name:: yumrepo
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
  default['yum']['epel']['key'] = "RPM-GPG-KEY-EPEL-6"
else
  default['yum']['epel']['url'] = "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-#{node['platform_version'].to_i}&arch=$basearch"

  # Note that the epel-release packages are the same regardless of arch, so we always fetch the i386 one.
  if node['platform_version'].to_i >= 6
    default['yum']['epel']['key'] = "RPM-GPG-KEY-EPEL-6"
  else
    default['yum']['epel']['key'] = "RPM-GPG-KEY-EPEL"
  end
end

default['yum']['epel']['key_url'] = "http://download.fedoraproject.org/pub/epel/#{node['yum']['epel']['key']}"

# The following is data for those people who prefer to install EPEL from the RPM, i.e.,
# who set node['yum']['prefer_rpm_repos'] to true
# Note that it is acceptable for the URLs to be outdated versions of the EPEL repos as long as they work,
# because yum update will then later update to the latest release.
case node['platform_version'].to_i
when 6
  default['yum']['epel']['rpm'] = "http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
when 5
  default['yum']['epel']['rpm'] = "http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
end
default['yum']['epel']['rpm_package_name'] = 'epel-release'

