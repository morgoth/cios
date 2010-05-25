# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
require 'lib/google_analytics'

Rails::Initializer.run do |config|

  config.time_zone = 'Warsaw'

  config.i18n.load_path += Dir[File.join(RAILS_ROOT, 'config', 'locales', 'defaults', '*.{rb,yml}')]
  config.i18n.default_locale = :pl

  config.middleware.use Rack::GoogleAnalytics, ENV['GOOGLE_ANALYTICS_ID'] || 'xxxx-x'
end
