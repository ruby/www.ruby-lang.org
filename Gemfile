source "https://rubygems.org"
ruby ENV['CUSTOM_RUBY_VERSION'] || '~> 2.6.3'

gem 'rake'
gem 'jekyll', '~> 3.0'
gem 'rouge',  '~> 1.10'

gem 'unicorn'
gem 'lanyon', '~> 0.4.0'
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
