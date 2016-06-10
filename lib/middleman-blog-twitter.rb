require "middleman-core"

Middleman::Extensions.register :middleman-blog-twitter do
  require "middleman-blog-twitter/extension"
  MiddlemanBlogTwitter
end
