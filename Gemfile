source :rubygems

gem "rails"
gem "haml"
gem "sass"
gem "compass"
gem "will_paginate", ">= 3.0.pre2"
gem "devise"
gem "simple_form", ">= 1.2.0"
gem "picasa", ">=0.1.9"
gem "acts_as_list"
gem "RedCloth", :require => "redcloth"
gem "defensio"
gem "httparty"
gem "sqlite3", :group => [:development, :test]
gem "jquery-rails"

group :test do
  gem "test-unit", ">=2.0", :require => "test/unit"
  gem "factory_girl_rails", "~> 1.1.rc1"
  gem "capybara"
  gem "launchy"
  gem "ruby-debug19", :require => "ruby-debug", :platform => :ruby_19
end

group :development do
  gem "hpricot"
  gem "ruby_parser"
end

group :production do
  gem "pg"
  gem "rack-rewrite"
end
