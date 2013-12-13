#
# Cookbook:: yum
# Recipe:: resource-tester
#
# Author:: Sean OMeara <someara@getchef.com>
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

# baseurl alias 'url'
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
  enable_group_conditionals true
  errorlevel '5'
  exactarch true
  exclude 'kernel emacs-nox'
  gpgcheck true
  group_package_types 'default mandatory'
  groupremove_leaf_only false
  history_list_view 'commands'
  history_record true
  history_record_packages 'rpm'
  http_caching true
  installonly_limit '3'
  installonlypkgs 'kernel, emacs-nox'
  installroot '/over/there'
  keepalive true
  keepcache true
  kernelpkgnames 'dowhatnow'
  localpkg_gpgcheck true
  logfile '/your/logs/here'
  max_retries '10'
  mdpolicy 'instant'
  metadata_expire '21600'
  mirrorlist_expire '21600'
  multilib_policy 'best'
  obsoletes true
  overwrite_groups true
  password 'ohai'
  path '/tmp/yum-full.conf'
  persistdir '/somewhere/good'
  pluginconfpath '/etc/yum/pluginconf.d'
  pluginpath '/path/to /some/plugins'
  plugins true
  protected_multilib true
  protected_packages 'yum glob:/etc/yum/protected.d/*.conf'
  proxy 'https://datproxy.biz'
  proxy_password 'evewashere'
  proxy_username 'alice'
  recent '7'
  repo_gpgcheck true
  reset_nice true
  rpmverbosity 'warn'
  showdupesfromrepos true
  skip_broken false
  ssl_check_cert_permissions true
  sslcacert '/path/to/cacert'
  sslclientcert '/path/to/clientcert'
  sslclientkey '/path/to/clientkey'
  sslverify true
  syslog_device '/dev/log'
  syslog_facility 'LOG_USER'
  syslog_ident 'chuck norris'
  throttle '100000M'
  timeout '30'
  tolerant false
  tsflags 'noscripts'
  username 'baub'
  action :create
end
