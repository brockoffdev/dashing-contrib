require 'rest-client'
require 'cgi'

module DashingContrib
  module Pingdom
    module Checks
      extend self

      def fetch(credentials, id)
        make_request(credentials, id)
      end

      private
      def make_request(credentials, id)
        request_url = "https://#{credentials.username}:#{credentials.password}@api.pingdom.com/api/2.0/checks/#{id}"
        response = RestClient.get(request_url, { 'App-Key' => credentials.api_key, 'Account-Email' => "jake.mcgraw@refinery29.com" })
        MultiJson.load response.body, { symbolize_keys: true }
      end
    end
  end
end