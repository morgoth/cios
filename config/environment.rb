# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml'
  config.gem "mislav-will_paginate", :lib => "will_paginate"
  config.gem "authlogic"
  config.gem 'morgoth-picasa', :lib => 'picasa'
  config.gem 'xml-simple', :lib => 'xmlsimple'
  #config.gem "RedCloth", :lib => "redcloth"

  config.time_zone = 'Warsaw'

  config.i18n.load_path += Dir[File.join(RAILS_ROOT, 'config', 'locales', 'defaults', '*.{rb,yml}')]
  config.i18n.default_locale = :pl
end
