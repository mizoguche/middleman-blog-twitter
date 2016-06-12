require 'middleman-cli'
require 'middleman-blog/uri_templates'

module Middleman
  module Cli
    class Twitter < ::Thor::Group
      include Thor::Actions
      include Middleman::Blog::UriTemplates

      check_unknown_options!

      namespace :tweet

      def self.exit_on_failure?
        true
      end

      def tweet
        env = options[:environment].to_s.to_sym
        verbose = options[:verbose] ? 0 : 1
        instrument = options[:instrument]

        ::Middleman::Blog::Twitter.app = ::Middleman::Application.new do
          config[:mode] = :build
          config[:environment] = env
          ::Middleman::Logger.singleton(verbose, instrument)
        end

        ::Middleman::Blog::Twitter.tweet
      end
    end

    Base.register(Middleman::Cli::Twitter, 'tweet', 'tweet [options]', 'Tweet latest article')
  end
end
