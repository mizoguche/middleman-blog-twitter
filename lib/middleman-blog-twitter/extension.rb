require 'middleman-core'
require 'middleman/blog/twitter'
require 'active_support'
require 'active_support/core_ext'

module Middleman
  module Blog
    class TwitterExtension < ::Middleman::Extension
      option :consumer_key, nil, 'Twitter consumer key'
      option :consumer_secret, nil, 'Twitter consumer secret'
      option :access_token, nil, 'Twitter access token'
      option :access_token_secret, nil, 'Twitter access token secret'
      option :hostname, nil, 'Your site hostname'
      option :template_path, 'tweet_template.txt.erb', 'Tweet template path'
      option :force_tweet, false, 'If true, tweet regardless of the date of latest article'
      option :new_article_threshold, 1.hour, 'Threshold if latest article'

      attr_reader :options

      def initialize(app, options_hash={}, &block)
        super

        @options = options
      end
    end
  end
end
