require 'middleman/blog/twitter/updater'
require 'middleman-blog/uri_templates'
require 'thor'

module Middleman
  module Cli
    class Twitter < ::Thor
      include Thor::Actions
      include Middleman::Blog::UriTemplates

      check_unknown_options!

      namespace :tweet

      def self.exit_on_failure?
        true
      end

      desc "tweet", "Tweets about your blog articles."
      def tweet
        shared_instance = ::Middleman::Application.server.inst
        blog_inst = shared_instance.blog
        latest_article = blog_inst.articles[0]

        updater = ::Middleman::Blog::Twitter::Updater.new(::Middleman::Blog::Twitter.twitter_settings)
        updater.tweet(latest_article)
      end
    end
  end
end
