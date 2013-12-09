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

  template "/etc/yum.repos.d/#{new_resource.repositoryid}.repo" do
    source 'repo.erb'
    cookbook 'yum'
    mode '0644'
    variables(:config => new_resource )
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
