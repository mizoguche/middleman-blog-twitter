require 'twitter'
require 'erb'

module Middleman
  module Blog
    module Twitter
      class Updater
        def initialize(settings)
          @settings = settings
          @client = ::Twitter::REST::Client.new do |config|
            config.consumer_key        = settings.consumer_key
            config.consumer_secret     = settings.consumer_secret
            config.access_token        = settings.access_token
            config.access_token_secret = settings.access_token_secret
          end
        end

        def tweet(latest_article)
          hostname = @settings.hostname

          erb = ERB.new(read_template)
          tweet = erb.result(binding)

          @client.update(tweet)
        end

        def read_template
          file = File.open(@settings.template_path, 'r')
          file.read
        end
      end
    end
  end
end
