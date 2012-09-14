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


module Gemfire
  
  # Used to enumerate GemFire nodes
  class Nodes < Shared::Collection

    # @private
    def initialize(location, client)
      super(location, client, "nodes", Node)
    end

  end

  # A GemFire node
  class Node < Shared::GroupableNode

    # @return [String] the Node's Java home
    attr_reader :java_home
    
    # @return [AgentNodeInstances] the node's agent instances
    attr_reader :agent_instances
    
    # @return [CacheServerInstances] the node's cache server instances
    attr_reader :cache_server_instances
    
    # @return [LocatorNodeInstances] the node's locator instances
    attr_reader :locator_instances

    # @private
    def initialize(location, client)
      super(location, client, Group)
      @java_home = details["java-home"]
      @agent_instances = AgentNodeInstances.new(Util::LinkUtils.get_link_href(details, "agent-node-instances"), client)
      @cache_server_instances = CacheServerNodeInstances.new(Util::LinkUtils.get_link_href(details, "cache-server-node-instances"), client)
      @locator_instances = LocatorNodeInstances.new(Util::LinkUtils.get_link_href(details, "locator-node-instances"), client)
    end

    # @return [String] a string representation of the node
    def to_s
      "#<#{self.class} host_names='#{host_names}' ip_addresses='#{ip_addresses}' operating_system='#{operating_system}' architecture='#{architecture}' agent_home='#{agent_home}' java_home='#{java_home}' metadata='#{metadata}'>"
    end

  end

end