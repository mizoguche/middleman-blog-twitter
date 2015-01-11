# Middleman::Blog::Twitter

Tweet about the latest article on Middleman blog.

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-blog-twitter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-blog-twitter

## Usage
### 1. Settings(Tweet text template)
Create ERB for tweet text(ex. `tweet_template.txt.erb`).

```ruby
Blog updated: <%= latest_article.title %> <%= hostname %><%= latest_article.url %>
```

#### Available variables

|name|value|
|---|---|
|latest_article|[Middleman::Sitemap::Resource](http://www.rubydoc.info/github/middleman/middleman/Middleman/Sitemap/Resource) included [Middleman::Blog::BlogArticle](http://www.rubydoc.info/github/middleman/middleman-blog/master/Middleman/Blog/BlogArticle) object of the latest blog article|
|hostname|Your blog hostname(set in the next section)|


### 2. Settings(Tokens, hostname, and template path)
On `config.rb`

```ruby
activate :blog_twitter do |twitter|
  twitter.consumer_key        = 'YOUR CONSUMER KEY'
  twitter.consumer_secret     = 'YOUR CONSUMER SECRET'
  twitter.access_token        = 'YOUR ACCESS TOKEN'
  twitter.access_token_secret = 'YOUR ACCESS TOKEN SECRET'
  twitter.hostname            = 'http://example.com' # your blog hostname
  twitter.template_path       = 'tweet_template.txt.erb'
end
```

### 3. Execute command
```sh
$ middleman tweet
```

then

> Blog updated: \<latest article title\> \<latest article url\>

## Contributing

1. Fork it ( http://github.com/<my-github-username>/middleman-blog-twitter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
