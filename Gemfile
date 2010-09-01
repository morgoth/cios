source :rubygems

gem "rails", ">=3.0.0"
gem "sqlite3-ruby", :require => 'sqlite3', :group => [:development, :test]

gem 'haml', ">=3.0.6"
gem 'will_paginate', :git => "http://github.com/mislav/will_paginate.git", :branch => "rails3"
gem "authlogic", :git => "http://github.com/odorcicd/authlogic.git", :branch => "rails3"
gem "simple_form", ">= 1.2.0"
gem 'picasa', ">=0.1.9"
gem 'xml-simple', :require => 'xmlsimple'
gem 'acts_as_list'
gem 'RedCloth', :require => 'redcloth'
gem 'defensio'

group :test do
  gem "test-unit", ">=2.0", :require => "test/unit"
  gem "factory_girl_rails"
end

group :production do
  gem "pg"
end
