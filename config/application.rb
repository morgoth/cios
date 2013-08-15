require File.expand_path("../boot", __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Cios
  class Application < Rails::Application
    config.time_zone = "Warsaw"

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "defaults", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :pl

    # Enable escaping HTML in JSON.
    # config.active_support.escape_html_entities_in_json = true
  end
end
