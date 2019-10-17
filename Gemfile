source "https://rubygems.org"
ruby ENV['CUSTOM_RUBY_VERSION'] || '~> 2.6.5'

gem 'rake'
gem 'jekyll'
gem 'rouge'

gem 'unicorn'
gem 'lanyon', git: "https://github.com/hsbt/lanyon", ref: "b84d5338b7e4138319311591c41ae41a66dcd3e8"
gem 'rack-rewrite'
gem 'rack-ssl'
gem 'rack-protection'

group :production do
  gem "sqreen"
end

group :development do
  gem 'minitest'
  gem 'spidr', '~> 0.6'
  gem 'validate-website', '~> 1.6'
end
