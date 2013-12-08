# Encoding: utf-8
#
# Cookbook:: yum
# Recipe:: resource-tester
#
# Author:: Sean OMeara <someara@opscode.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is to be used for unit testing with chefspec only.

# The simplest case
yum_repository 'test1' do
  description 'an test'
  baseurl 'http://drop.the.baseurl.biz'
  action :create
end

# Full blown parameterization. Exercercises the
# recipe->resource->provider->template chain
yum_repository 'test2' do
  description 'test all the things!'
  baseurl 'http://example.com/wat'
  cost  '10'
  enabled true
  enablegroups true
  exclude 'package1 package2 package3'
  failovermethod 'priority'
  fastestmirror_enabled true
  gpgcheck true
  gpgkey 'http://example.com/RPM-GPG-KEY-FOOBAR-1'
  http_caching 'all'
  include_config '/some/other.repo'
  includepkgs 'package4 package5'
  keepalive true
  max_retries '10'
  metadata_expire 'never'
  mirror_expire '300'
  mirrorlist_expire '86400'
  mirrorlist 'http://hellothereiammirrorliststring.biz'
  priority '10'
  proxy 'http://hellothereiamproxystring.biz'
  proxy_username 'kermit'
  proxy_password 'dafrog'
  report_instanceid false
  repositoryid 'unit-test-2'
  sslcacert '/path/to/directory'
  sslclientcert '/path/to/client/cert'
  sslclientkey '/path/to/client/key'
  sslverify true
  timeout '10'
  action :create
end

# create alias 'add'
yum_repository 'test3' do
  description 'an test'
  baseurl 'http://drop.the.baseurl.biz'
  action :add
end

# delete alias 'remove'
yum_repository 'test4' do
  description 'an test'
  baseurl 'http://drop.the.baseurl.biz'
  action :remove
end

# base alias 'url'
yum_repository 'test5' do
  description 'an test'
  url 'http://drop.the.baseurl.biz'
  action :create
end

# gpgkey alias 'keyurl'
yum_repository 'test6' do
  description 'an test'
  url 'http://drop.the.baseurl.biz'
  keyurl 'http://example.com/RPM-GPG-KEY-FOOBAR-1'
  action :create
end
