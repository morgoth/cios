source "https://rubygems.org"

ruby "2.0.0"

gem "rails", ">= 4.0.0"
gem "haml"
gem "will_paginate", ">= 3.0"
gem "devise"
gem "devise-encryptable"
gem "simple_form", ">= 3.0.0.rc"
gem "picasa", ">= 0.6.0"
gem "acts_as_list",">= 0.1.8"
gem "RedCloth", require: "redcloth"
gem "defensio", github: "defensio/defensio-ruby"
gem "httparty"
gem "jquery-rails"
gem "routing-filter", ">= 0.4.0.pre"

# assets
gem "sass-rails", ">= 3.2.3"
gem "uglifier"

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
end

group :development, :test do
  gem "debugger", ">= 1.6.1"
  gem "sqlite3"
  gem "minitest-rails"
  gem "minitest-rails-capybara"
end

group :production do
  gem "thin"
  gem "pg"
  gem "rack-rewrite"
end
