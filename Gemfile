source :rubygems

gem "rails", "~> 3.1.0.rc5"
gem "haml"
gem "will_paginate", ">= 3.0"
gem "devise"
gem "simple_form", ">= 1.2.0"
gem "picasa", ">=0.1.9"
gem "acts_as_list"
gem "RedCloth", :require => "redcloth"
gem "defensio"
gem "httparty"
gem "sqlite3", :group => [:development, :test]
gem "jquery-rails"

group :assets do
  gem "sass"
  gem "compass", :git => "git://github.com/chriseppstein/compass.git", :branch => "rails31"
  gem "sass-rails", "~> 3.1.0.rc.5"
  gem "uglifier"
end

group :test do
  gem "factory_girl_rails", "~> 1.1"
  gem "capybara"
  gem "launchy"
  gem "ruby-debug19", :require => "ruby-debug", :platform => :ruby_19
  gem "turn", :require => false
end

group :development do
  gem "hpricot"
  gem "ruby_parser"
end

group :production do
  gem "pg"
  gem "rack-rewrite"
end
