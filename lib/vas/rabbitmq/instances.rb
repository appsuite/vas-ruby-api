# vFabric Administration Server Ruby API
# Copyright (c) 2012 VMware, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module RabbitMq

  # Used to enumerate, create, and delete RabbitMQ instances
  class Instances < Shared::MutableCollection

    # @private
    def initialize(location, client)
      super(location, client, 'group-instances', Instance)
    end

    # Creates a new instance
    #
    # @param installation [Installation] the installation to be used by the instance
    # @param name [String] the name of the instance
    #
    # @return  [Instance] the new instance
    def create(installation, name)
      payload = { :installation => installation.location, :name => name }
      super(payload, 'group-instance')
    end

  end

  # A RabbitMQ instance
  class Instance < Shared::Instance

    # @private
    def initialize(location, client)
      super(location, client, Group, Installation, LiveConfigurations, PendingConfigurations, NodeInstance, 'node-instance')
      @plugins = Plugins.new(Util::LinkUtils.get_link_href(details, "plugins"), client)
    end

    # Updates the instance to use a different installation
    #
    # @param installation [Installation] the installation that the instance should use
    #
    # @return [void]
    def update(installation)
      client.post(location, { :installation => installation.location })
      reload
    end

    # @return [Plugins] the instance's plugins
    def plugins
      @plugins ||= Plugins.new(Util::LinkUtils.get_link_href(details, 'plugins'), client)
    end

  end

end