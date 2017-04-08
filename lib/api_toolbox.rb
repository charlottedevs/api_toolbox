require "interactor"
require "httparty"

require "api_toolbox/fetch_user"
require "api_toolbox/post_event_to_api"
require "api_toolbox/version"

module ApiToolbox
  class Config
    class << self
      def base_url
        ENV["API_URL"] || raise("ENV['API_URL'] not defined")
      end

      alias url base_url

      def events_url
        ENV["API_EVENTS_URL"] || "#{base_url}/events"
      end

      def users_url
        ENV["API_USERS_URL"] || "#{base_url}/users"
      end

      def auth_headers
        {
          "Authorization" => "Bearer #{ENV.fetch('API_TOKEN')}"
        }
      end
    end
  end
end
