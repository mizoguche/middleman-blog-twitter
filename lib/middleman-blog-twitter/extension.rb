require 'middleman-core'
require 'middleman/blog/twitter'

module Middleman
  module Blog
    class TwitterExtension < ::Middleman::Extension
      option :consumer_key, nil, 'Twitter consumer key'
      option :consumer_secret, nil, 'Twitter consumer secret'
      option :access_token, nil, 'Twitter access token'
      option :access_token_secret, nil, 'Twitter access token secret'
      option :hostname, nil, 'Your site hostname'
      option :template_path, 'tweet_template.txt.erb', 'Tweet template path'
      option :tweet_if_new, true, 'Tweet if latest article written in a day'

      attr_reader :options

      def initialize(app, options_hash={}, &block)
        super

        @options = options
      end
    end
  end
end
