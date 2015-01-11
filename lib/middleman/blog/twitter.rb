require "middleman/blog/twitter/version"
require "middleman/blog/twitter/cli"
require "middleman/blog/twitter/settings"

module Middleman
  module Blog
    module Twitter
      class << self
        attr_accessor :settings

        def registered(app, options_hash = {}, &block)
          settings = Settings.new
          yield settings if block_given?
          @settings = settings
        end

        def twitter_settings
          @settings
        end
      end
    end
  end
end

::Middleman::Extensions.register(:blog_twitter) do
  ::Middleman::Blog::Twitter
end
