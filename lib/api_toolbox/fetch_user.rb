module ApiToolbox
  class FetchUser
    include ::Interactor

    def call
      HTTParty.get(users_url, query: user_params).tap do |res|
        context.fail!(errors: res.body) unless res.success?
        context.user = JSON.parse(res.body)
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
