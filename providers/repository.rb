# Encoding: utf-8
#
# Cookbook Name:: yum
# Provider:: repository
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

use_inline_resources

action :create  do

  template "/etc/yum.repos.d/#{new_resource.repositoryid}.repo" do
    source 'repo.erb'
    cookbook 'yum'
    mode '0644'
    variables(
      :baseurl => new_resource.baseurl,
      :cost => new_resource.cost,
      :description => new_resource.description,
      :enabled => new_resource.enabled,
      :enablegroups => new_resource.enablegroups,
      :exclude => new_resource.exclude,
      :failovermethod => new_resource.failovermethod,
      :fastestmirror_enabled => new_resource.fastestmirror_enabled,
      :gpgcheck => new_resource.gpgcheck,
      :gpgkey => new_resource.gpgkey,
      :http_caching => new_resource.http_caching,
      :include_config => new_resource.include_config,
      :includepkgs => new_resource.includepkgs,
      :keepalive => new_resource.keepalive,
      :max_retries => new_resource.max_retries,
      :metadata_expire => new_resource.metadata_expire,
      :mirrorexpire => new_resource.mirrorexpire,
      :mirrorlist => new_resource.mirrorlist,
      :mirror_expire => new_resource.mirror_expire,
      :mirrorlist_expire => new_resource.mirrorlist_expire,
      :priority => new_resource.priority,
      :proxy => new_resource.proxy,
      :proxy_username => new_resource.proxy_username,
      :proxy_password => new_resource.proxy_password,
      :report_instanceid => new_resource.report_instanceid,
      :repositoryid => new_resource.repositoryid,
      :sslcacert => new_resource.sslcacert,
      :sslclientcert => new_resource.sslclientcert,
      :sslclientkey => new_resource.sslclientkey,
      :sslverify => new_resource.sslverify,
      :timeout => new_resource.timeout
      )
    notifies :run, "execute[yum-makecache-#{new_resource.repositoryid}]", :immediately
    notifies :create, "ruby_block[yum-cache-reload-#{new_resource.repositoryid}]", :immediately
  end

  # get the metadata for this repo only
  execute "yum-makecache-#{new_resource.repositoryid}" do
    command "yum -q makecache --disablerepo=* --enablerepo=#{new_resource.repositoryid}"
    action :nothing
  end

  # reload internal Chef yum cache
  ruby_block "yum-cache-reload-#{new_resource.repositoryid}" do
    block do
      Chef::Provider::Package::Yum::YumCache.instance.reload
    end
    action :nothing
  end
end

action :delete do
  file "/etc/yum.repos.d/#{new_resource.repositoryid}.repo" do
    action :delete
  end
end

alias_method :action_add, :action_create
alias_method :action_remove, :action_delete
