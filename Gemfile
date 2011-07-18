source :rubygems

gem "rails", "~> 3.1.0.rc4"
gem "haml"
gem "sass"
gem "sass-rails", :git => "git://github.com/rails/sass-rails.git", :branch => "3-1-stable"
gem "compass", :git => "git://github.com/chriseppstein/compass.git", :branch => "rails31"
gem "uglifier"

gem "will_paginate", :git => "git://github.com/wantful/will_paginate.git", :ref => "f9825e371a516ef2662a"
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
  gem "factory_girl_rails", "~> 1.1.rc1"
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
