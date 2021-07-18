#
# Cookbook:: grafana
# Resource:: config_external_image_storage
#
# Copyright:: 2018, Sous Chefs
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
# Configures the installed grafana instance

unified_mode true

use 'partial/_config_file'

property  :instance_name,           String,         name_property: true
property  :storage_provider,        String,         default: 's3'
property  :region,                  String,         required: true
property  :bucket,                  String
property  :bucket_url,              String
property  :path,                    String
property  :access_key,              String
property  :secret_key,              String

action_class do
  include GrafanaCookbook::ConfigHelper
end

action :install do
  resource_properties.each do |rp|
    next if nil_or_empty?(new_resource.send(rp))

    run_state_config_set(rp.to_s, new_resource.send(rp), new_resource.instance_name, 'config', 'external_image_storage')
  end
end
