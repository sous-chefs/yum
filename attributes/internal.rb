#
# Cookbook Name:: yum
# Attributes:: internal
#
# Author:: Sean OMeara <someara@opscode.com>
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

default['yum']['internal']['key'] = "RPM-GPG-KEY-EPEL-6"
default['yum']['internal']['key_url'] = "http://your_yum_repo_here/centos/6.3/os/x86_64/RPM-GPG-KEY-CentOS-6"
default['yum']['internal']['url'] = "http://your_yum_repo_here/centos/6.3/os/x86_64/"
