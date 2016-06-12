require 'middleman-core'
require 'middleman-blog-twitter/commands'
require 'middleman/blog/twitter'

Middleman::Extensions.register :blog_twitter do
  require "middleman-blog-twitter/extension"
  ::Middleman::Blog::TwitterExtension
end
