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

module TcServer
  class TestLogs < VasTestCase
  
    def test_list
      logs = Logs.new(
          'https://localhost:8443/tc-server/v1/nodes/1/instances/2/logs/',
          StubClient.new)
      assert_count(2, logs)
    end
  
    def test_log
      location = 'https://localhost:8443/tc-server/v1/nodes/0/instances/3/logs/4/'
        
      log = Log.new(location, StubClient.new)
  
      assert_equal('catalina.out', log.name)
      assert_equal(17638, log.size)
      assert_equal(1337872856, log.last_modified)

      assert_equal('https://localhost:8443/tc-server/v1/nodes/0/instances/3/', log.instance.location)
    end

    def test_content
      log = Log.new('https://localhost:8443/tc-server/v1/nodes/0/instances/3/logs/4/', StubClient.new)
      content = ""
      log.content { |chunk| content << chunk}
      assert_equal('somestreamedcontent', content)
    end


    def test_content_with_start_line
      log = Log.new('https://localhost:8443/tc-server/v1/nodes/0/instances/3/logs/4/', StubClient.new)
      content = ""
      log.content({:start_line => 2}) { |chunk| content << chunk}
      assert_equal('content', content)
    end

    def test_content_with_end_line
      log = Log.new('https://localhost:8443/tc-server/v1/nodes/0/instances/3/logs/4/', StubClient.new)
      content = ""
      log.content({:end_line => 1}) { |chunk| content << chunk}
      assert_equal('somestreamed', content)
    end
  end
end