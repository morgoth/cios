source "https://rubygems.org"

ruby "2.1.5"

gem "rails", ">= 4.1.8"
gem "bcrypt"
gem "haml"
gem "will_paginate", ">= 3.0"
gem "simple_form", ">= 3.0.0"
gem "picasa", ">= 0.6.0"
gem "acts_as_list",">= 0.1.8"
gem "RedCloth", require: "redcloth"
gem "defensio", github: "defensio/defensio-ruby"
gem "httparty"
gem "jquery-rails"
gem "routing-filter", ">= 0.4.0.pre"
gem "turbolinks"

gem "active_model-session"
gem "active_model-password_reset"

# assets
gem "sass-rails", ">= 3.2.3"
gem "uglifier"

group :development do
  gem "spring", require: false
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
end

group :development, :test do
  gem "byebug"
  gem "sqlite3"
  gem "minitest-rails"
  gem "minitest-rails-capybara"
end

group :production do
  gem "rails_12factor" # heroku
  gem "unicorn", require: false
  gem "pg"
  gem "rack-rewrite"
end
