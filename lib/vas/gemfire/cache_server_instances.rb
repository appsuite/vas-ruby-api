#--
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
#++

module Gemfire

  # Used to enumerate, create, and delete cache server instances.
  class CacheServerInstances < Shared::MutableCollection

    def initialize(location, client) #:nodoc:
      super(location, client, "cache-server-group-instances", CacheServerInstance)
    end

    # Creates a new instance named +name+, using the given +installation+.
    def create(installation, name)
      payload = { :installation => installation.location, :name => name }
      CacheServerInstance.new(client.post(location, payload, "cache-server-group-instance"), client)
    end

  end

  # A cache server instance
  class CacheServerInstance < Shared::Instance

    # The instance's live application code
    attr_reader :live_application_code

    # The instance's pending application code
    attr_reader :pending_application_code

    def initialize(location, client) #:nodoc:
      super(location, client, Group, Installation, CacheServerLiveConfigurations, CacheServerPendingConfigurations, CacheServerNodeInstance, 'cache-server-node-instance')
      @live_application_code = LiveApplicationCodes.new(Util::LinkUtils.get_link_href(details, 'live-application-code'), client)
      @pending_application_code = PendingApplicationCodes.new(Util::LinkUtils.get_link_href(details, 'pending-application-code'), client)
    end

    # Updates the instance to use the given +installation+
    def update(installation)
      client.post(location, { :installation => installation.location });
    end

  end

end