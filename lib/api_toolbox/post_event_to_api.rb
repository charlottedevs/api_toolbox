module ApiToolbox
  class PostEventToAPI
    include ::Interactor

    def call
      res = HTTParty.post(events_url, body: event_params, headers: ApiToolbox::Config.auth_headers)
      context.response = res
      return unless res.success?
      context.fail!(errors: res.body)
    end

    private

    def events_url
      ApiToolbox::Config.events_url
    end

    def event_params
      context.event_params ||= build_event_params
    end

    def build_event_params
      {
        event: {
          category: context.event_category,
          user_id:  user_id
        }
      }
    end

    def user_id
      context.user_id ||= Hash(context.user).fetch("id") { raise "context.user_id or context.user not defined" }
    end
  end
end
