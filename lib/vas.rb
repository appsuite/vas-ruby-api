# vFabric Administration Server Ruby API
# Copyright (c) 2012 VMware, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'json'
require 'net/http/post/multipart'
require 'vas/shared/resource'
require 'vas/shared/collection'
require 'vas/shared/mutable_collection'
require 'vas/shared/configuration'
require 'vas/shared/groups'
require 'vas/shared/installations'
require 'vas/shared/installation_images'
require 'vas/shared/pending_configuration'
require 'vas/shared/security'
require 'vas/shared/state_resource'
require 'vas/shared/instances'
require 'vas/shared/logs'
require 'vas/shared/node_instances'
require 'vas/shared/nodes'
require 'vas/rabbit/configuration'
require 'vas/rabbit/groups'
require 'vas/rabbit/installation_images'
require 'vas/rabbit/plugin_images'
require 'vas/rabbit/plugins'
require 'vas/rabbit/installations'
require 'vas/rabbit/instances'
require 'vas/rabbit/live_configurations'
require 'vas/rabbit/logs'
require 'vas/rabbit/node_instances'
require 'vas/rabbit/nodes'
require 'vas/rabbit/pending_configurations'
require 'vas/rabbit/rabbit'
require 'vas/tc_server/applications'
require 'vas/tc_server/configuration'
require 'vas/tc_server/groups'
require 'vas/tc_server/installation_images'
require 'vas/tc_server/installations'
require 'vas/tc_server/instances'
require 'vas/tc_server/live_configurations'
require 'vas/tc_server/logs'
require 'vas/tc_server/node_applications'
require 'vas/tc_server/node_instances'
require 'vas/tc_server/node_revisions'
require 'vas/tc_server/nodes'
require 'vas/tc_server/pending_configurations'
require 'vas/tc_server/revision_images'
require 'vas/tc_server/revisions'
require 'vas/tc_server/tc_server'
require 'vas/tc_server/template_images'
require 'vas/tc_server/templates'
require 'vas/util/client'
require 'vas/util/link_utils'
require 'vas/vas_exception'
require 'vas/vfabric/agent_image'
require 'vas/vfabric/nodes'
require 'vas/vfabric/v_fabric'
require 'vas/vfabric_administration_server'
require 'zip/zipfilesystem'