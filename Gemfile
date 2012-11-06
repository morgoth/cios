source "https://rubygems.org"

ruby "1.9.3"

gem "rails", ">= 3.2.9.rc2"
gem "haml"
gem "will_paginate", ">= 3.0"
gem "devise"
gem "devise-encryptable"
gem "simple_form", ">= 1.2.0"
gem "picasa", ">= 0.6.0"
gem "acts_as_list",">= 0.1.8"
gem "RedCloth", require: "redcloth"
gem "defensio"
gem "httparty"
gem "jquery-rails"
gem "routing-filter"
gem "turbolinks"

group :assets do
  gem "compass-rails"
  gem "sass-rails", "~> 3.2.3"
  gem "coffee-rails", "~> 3.2.1"
  gem "uglifier"
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
end

group :development, :test do
  gem "debugger"
  gem "sqlite3"
  gem "minitest-rails"
  gem "minitest-rails-capybara"
end

group :production do
  gem "thin"
  gem "pg"
  gem "rack-rewrite"
end
