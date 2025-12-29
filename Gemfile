source "https://rubygems.org"

gem "rake"
gem "jekyll"
gem "rouge"

# We didn't use development group for them
# Because lockfile is generated without `BUNDLE_WITHOUT` env variable
# so, some environment couldn't install them
gem "minitest"
gem "html-proofer"
gem "validate-website", "~> 1.6"

# Jekyll need them for Ruby 3.4+
gem "csv"
gem "base64"

group :jekyll_plugins do
  gem 'jekyll-postcss-v2'
end
