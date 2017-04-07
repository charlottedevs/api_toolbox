module ApiToolbox
  class FetchUser
    include ::Interactor

    def call
      HTTParty.get(users_url, query: user_params).tap do |res|
        context.fail!(errors: res.body) unless res.success?
        parsed_response = JSON.parse(res.body)
        context.fail!(errors: { response: "no content" }) if parsed_response.empty?
        context.user = parsed_response
      end
    end

    private

    def user_params
      context.user_params || raise("context.user_params not defined")
    end

    def users_url
      ApiToolbox::Config.users_url
    end
  end
end
