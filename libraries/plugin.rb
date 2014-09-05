#
# Author:: John Bellone <jbellone@bloomberg.net>
# Library:: plugin
#
# Copyright 2014, Bloomberg L.P.
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

class Chef
  class Resource::YumPlugin < Resource::LWRPBase
    identity_attr :plugin_name
    provides :yum_plugin

    self.resource_name = :yum_plugin

    actions :create, :delete
    default_action :create

    attribute :enabled, :kind_of => [TrueClass, FalseClass], :default => false
    attribute :config_path, :kind_of => String, :default => lazy { default_config_path }
    attribute :plugin_name, :kind_of => String, :name_attribute => true
    attribute :source, :kind_of => String, :default => 'plugin.erb'

    def default_config_path
      ::File.join(run_context.yum.main.pluginconfpath, "#{plugin_name}.conf")
    end
  end

  class Provider::YumPlugin < Provider::LWRPBase
    def whyrun_supported?
      true
    end

    def load_current_resource
      @current_resource
    end

    def action_create
      template new_resource.config_path do
        source new_resource.source
        cookbook new_resource.cookbook_name
        mode '0644'
        variables(@config => new_resource)
      end
    end

    def action_delete
      file new_resource.config_path do
        action :delete
      end
    end
  end
end
