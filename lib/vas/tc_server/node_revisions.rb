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

module TcServer

  # Used to enumerate Node Revision s
  class NodeRevisions < Shared::Collection
    
    def initialize(location, client) #:nodoc:
      super(location, client, 'revisions', NodeRevision)
    end
    
  end

  # A revision of a NodeApplication
  class NodeRevision < Shared::StateResource

    # The Revision's version
    attr_reader :version

    # The Revision's application
    attr_reader :application

    # The revision's group revision
    attr_reader :group_revision
    
    def initialize(location, client) #:nodoc:
      super(location, client)
      
      @version = details['version']
      @application = NodeApplication.new(Util::LinkUtils.get_link_href(details, 'node-application'), client)
      @group_revision = Revision.new(Util::LinkUtils.get_link_href(details, 'group-revision'), client)
    end

    def to_s #:nodoc:
      "#<#{self.class} version='#@version'>"
    end

  end

end