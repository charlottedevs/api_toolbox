module ApiToolbox
  class FetchUser
    include ::Interactor

    def call
      HTTParty.get(users_url, query: user_params, headers: ApiToolbox::Config.auth_headers).tap do |res|
        handle_response(res)
      end
    end

    private

    def handle_response(response)
      context.fail!(errors: response.body) unless response.success?
      parsed_response = JSON.parse(response.body)
      context.fail!(errors: { response: "no content" }) if parsed_response.nil? || parsed_response.empty?
      context.user = parsed_response
    end

    def user_params
      context.user_params || raise("context.user_params not defined")
    end

    def users_url
      ApiToolbox::Config.users_url
    end
  end
end
