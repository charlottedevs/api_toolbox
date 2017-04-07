module ApiToolbox
  class PostEventToAPI
    include ::Interactor

    def call
      res = HTTParty.post(events_url, body: event_params)
      return unless res.success?
      context.fail!(errors: res.errors)
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
          event_category: context.event_category,
          user_id:        context.user_id
        }
      }
    end

    def user_id
      Hash(context.user)["id"]
    end
  end
end
