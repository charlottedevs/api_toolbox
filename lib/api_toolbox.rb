require "interactor"
require "httparty"

require "api_toolbox/fetch_user"
require "api_toolbox/post_event_to_api"
require "api_toolbox/version"

module ApiToolbox
  class Config
    class << self
      def url
        ENV["API_URL"] || raise("ENV['API_URL'] not defined")
      end
    end
  end
end
