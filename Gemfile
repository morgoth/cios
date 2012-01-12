source "https://rubygems.org"

gem "rails", "~> 3.2.0.rc2"
gem "haml"
gem "will_paginate", ">= 3.0"
gem "devise"
gem "simple_form", ">= 1.2.0"
gem "picasa", ">=0.1.9"
gem "acts_as_list"
gem "RedCloth", :require => "redcloth"
gem "defensio"
gem "httparty"
gem "jquery-rails"

group :assets do
  gem "sass"
  gem "compass", "~>0.12.alpha.4"
  gem "sass-rails", "~> 3.2.3"
  gem "uglifier"
end

group :test do
  gem "factory_girl_rails", "~> 1.1"
  gem "capybara"
  gem "launchy"
  gem "turn", :require => false
end

group :development do
  gem "hpricot"
  gem "ruby_parser"
end

group :development, :test do
  gem "sqlite3"
end

group :production do
  gem "thin"
  gem "pg"
  gem "rack-rewrite"
end
