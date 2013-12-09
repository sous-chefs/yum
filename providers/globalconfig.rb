#
# Cookbook Name:: yum
# Provider:: repository
#
# Author:: Sean OMeara <someara@getchef.com>
# Copyright 2013, Chef
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

use_inline_resources

action :create  do

  template new_resource.path do
    source 'main.erb'
    cookbook 'yum'
    mode '0644'
    variables(
      :alwaysprompt => new_resource.alwaysprompt,
      :assumeyes => new_resource.assumeyes,
      :bandwidth => new_resource.bandwidth,
      :bugtracker_url => new_resource.bugtracker_url,
      :cachedir => new_resource.cachedir,
      :clean_requirements_on_remove => new_resource.clean_requirements_on_remove,
      :color => new_resource.color,
      :color_list_available_downgrade => new_resource.color_list_available_downgrade,
      :color_list_available_install => new_resource.color_list_available_install,
      :color_list_available_reinstall => new_resource.color_list_available_reinstall,
      :color_list_available_upgrade => new_resource.color_list_available_upgrade,
      :color_list_installed_extra => new_resource.color_list_installed_extra,
      :color_list_installed_newer => new_resource.color_list_installed_newer,
      :color_list_installed_older => new_resource.color_list_installed_older,
      :color_list_installed_reinstall => new_resource.color_list_installed_reinstall,
      :color_search_match => new_resource.color_search_match,
      :color_update_installed => new_resource.color_update_installed,
      :color_update_local => new_resource.color_update_local,
      :color_update_remote => new_resource.color_update_remote,
      :commands => new_resource.commands,
      :debuglevel => new_resource.debuglevel,
      :diskspacecheck => new_resource.diskspacecheck,
      :distroverpkg => new_resource.distroverpkg,
      :enable_group_conditionals => new_resource.enable_group_conditionals,
      :errorlevel => new_resource.errorlevel,
      :exactarch => new_resource.exactarch,
      :exclude => new_resource.exclude,
      :gpgcheck => new_resource.gpgcheck,
      :group_package_types => new_resource.group_package_types,
      :groupremove_leaf_only => new_resource.groupremove_leaf_only,
      :history_list_view => new_resource.history_list_view,
      :history_record => new_resource.history_record,
      :history_record_packages => new_resource.history_record_packages,
      :http_caching => new_resource.http_caching,
      :installonly_limit => new_resource.installonly_limit,
      :installonlypkgs => new_resource.installonlypkgs,
      :installroot => new_resource.installroot,
      :keepalive => new_resource.keepalive,
      :keepcache => new_resource.keepcache,
      :kernelpkgnames => new_resource.kernelpkgnames,
      :localpkg_gpgcheck => new_resource.localpkg_gpgcheck,
      :logfile => new_resource.logfile,
      :max_retries => new_resource.max_retries,
      :mdpolicy => new_resource.mdpolicy,
      :metadata_expire => new_resource.metadata_expire,
      :mirrorlist_expire => new_resource.mirrorlist_expire,
      :multilib_policy => new_resource.multilib_policy,
      :obsoletes => new_resource.obsoletes,
      :overwrite_groups => new_resource.overwrite_groups,
      :password => new_resource.password,
      :path => new_resource.path,
      :persistdir => new_resource.persistdir,
      :pluginconfpath => new_resource.pluginconfpath,
      :pluginpath => new_resource.pluginpath,
      :plugins => new_resource.plugins,
      :protected_multilib => new_resource.protected_multilib,
      :protected_packages => new_resource.protected_packages,
      :proxy => new_resource.proxy,
      :proxy_password => new_resource.proxy_password,
      :proxy_username => new_resource.proxy_username,
      :recent => new_resource.recent,
      :repo_gpgcheck => new_resource.repo_gpgcheck,
      :reset_nice => new_resource.reset_nice,
      :rpmverbosity => new_resource.rpmverbosity,
      :showdupesfromrepos => new_resource.showdupesfromrepos,
      :skip_broken => new_resource.skip_broken,
      :ssl_check_cert_permissions => new_resource.ssl_check_cert_permissions,
      :sslcacert => new_resource.sslcacert,
      :sslclientcert => new_resource.sslclientcert,
      :sslclientkey => new_resource.sslclientkey,
      :sslverify => new_resource.sslverify,
      :syslog_device => new_resource.syslog_device,
      :syslog_facility => new_resource.syslog_facility,
      :syslog_ident => new_resource.syslog_ident,
      :throttle => new_resource.throttle,
      :timeout => new_resource.timeout,
      :tolerant => new_resource.tolerant,
      :tsflags => new_resource.tsflags,
      :username => new_resource.username
      )
  end

end

action :delete do
  file new_resource.path do
    action :delete
  end
end
