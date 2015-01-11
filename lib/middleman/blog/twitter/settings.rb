module Middleman
  module Blog
    module Twitter
      class Settings
        OPTIONS = [
          :access_token,
          :access_token_secret,
          :consumer_key,
          :consumer_secret,
          :hostname,
          :template_path
        ]
        attr_accessor *OPTIONS
      end
    end
  end
end
