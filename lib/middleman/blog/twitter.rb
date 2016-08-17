require 'middleman/blog/twitter/version'
require 'middleman-blog-twitter'
require 'middleman-blog-twitter/extension'
require 'twitter'
require 'active_support'
require 'active_support/core_ext'

module Middleman
  module Blog
    module Twitter
      class << self
        attr_reader :app

        def tweet
          @app ||= ::Middleman::Application.new

          blog_extension = @app.extensions[:blog].values.first
          latest_article = blog_extension.data.articles.select{ |a| a.published? }.first
          return unless should_tweet(latest_article)

          hostname = settings.hostname
          erb = ERB.new(read_template)
          tweet = erb.result(binding)
          client.update(tweet)
        end

        def app=(app)
          @app = app
        end

        private

        def settings
          @app.extensions[:blog_twitter].options
        end

        def client
          ::Twitter::REST::Client.new do |config|
            config.consumer_key        = settings.consumer_key
            config.consumer_secret     = settings.consumer_secret
            config.access_token        = settings.access_token
            config.access_token_secret = settings.access_token_secret
          end
        end

        def read_template
          file = File.open(settings.template_path, 'r')
          file.read
        end

        def should_tweet(latest_article)
          true unless settings.tweet_if_new
          (latest_article.date >= DateTime.now.ago(1.day)) && latest_article.published?
        end
      end
    end
  end
end
