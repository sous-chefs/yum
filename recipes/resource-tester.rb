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

########

# default configuration
yum_globalconfig '/tmp/yum.conf' do
  action :create
end

# Full blown parameterization. Exercercises the
# recipe->resource->provider->template chain
yum_globalconfig '/tmp/yum-full.conf' do
  alwaysprompt true
  assumeyes true
  bandwidth '40'
  bugtracker_url 'http://somewhere.eltz.biz'
  clean_requirements_on_remove true
  cachedir '/path/to/somewhere/good'
  color 'always'
  color_list_available_downgrade 'fg:green'
  color_list_available_install 'fg:green'
  color_list_available_reinstall 'fg:green'
  color_list_available_upgrade 'fg:green'
  color_list_installed_extra 'fg:green'
  color_list_installed_newer 'fg:green'
  color_list_installed_older 'fg:green'
  color_list_installed_reinstall 'fg:green'
  color_search_match 'bold'
  color_update_installed 'fg:blue'
  color_update_local 'fg:blue'
  color_update_remote 'fg:blue'
  commands '--installroot=root=/over/there'
  debuglevel '5'
  diskspacecheck true
  distroverpkg 'fedora-release'
  enable_group_conditionals false
  errorlevel '5'
  exactarch true
  exclude 'kernel emacs-nox'
  gpgcheck true
  group_package_types 'default mandatory'
  groupremove_leaf_only false
  history_list_view 'commands'
  history_record ''
  history_record_packages ''
  http_caching ''
  installonly_limit ''
  installonlypkgs ''
  installroot ''
  keepalive ''
  keepcache ''
  kernelpkgnames ''
  localpkg_gpgcheck ''
  logfile ''
  max_retries ''
  mdpolicy ''
  metadata_expire ''
  mirrorlist_expire ''
  multilib_policy ''
  obsoletes ''
  overwrite_groups ''
  password ''
  path ''
  persistdir ''
  pluginconfpath ''
  pluginpath ''
  plugins ''
  protected_multilib ''
  protected_packages ''
  proxy ''
  proxy_password ''
  proxy_username ''
  recent ''
  repo_gpgcheck ''
  reset_nice ''
  rpmverbosity ''
  showdupesfromrepos ''
  skip_broken ''
  ssl_check_cert_permissions ''
  sslcacert ''
  sslclientcert ''
  sslclientkey ''
  sslverify ''
  syslog_device ''
  syslog_facility ''
  syslog_ident ''
  throttle ''
  timeout ''
  tolerant ''
  tsflags ''
  username ''
  action :create
 end
