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
  
  # @abstract The base of all types that interact with the REST API. A resource should map to a
  #   specific URI in the REST API
  class Resource
    
    # @private
    attr_reader :location
  
    # @return [Security] the resource's security
    attr_reader :security
    
    private
    
    attr_reader :client

    attr_reader :details
    
    # @private
    def initialize(location, client)
      @location = location
      @client = client

      @details = client.get(location)

      @security = Security.new(Util::LinkUtils.get_link_href(@details, 'security'), client)

    end
  
  end
  
end