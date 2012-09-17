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


module Shared
  
  # @abstract A resource that has state, i.e. it can be started and stopped and its state can
  #   be queried
  class StateResource < Resource
    
    # @private
    def initialize(location, client)
      super(location, client)
      @state_location = Util::LinkUtils.get_link_href(details, 'state')
    end

    # Starts the resource
    #
    # @return [void]
    def start
      client.post(@state_location, { :status => 'STARTED' })
    end
    
    # Stops the resource
    #
    # @return [void]
    def stop
      client.post(@state_location, { :status => 'STOPPED' })
    end

    # @return [String] the state of the resource
    def state
      client.get(@state_location)['status']
    end
  
  end
  
end