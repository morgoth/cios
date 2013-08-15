require File.expand_path("../boot", __FILE__)

require "rails/all"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Cios
  class Application < Rails::Application
    config.time_zone = "Warsaw"

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "defaults", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :pl

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true
    config.assets.version = "1.0"

    config.active_record.whitelist_attributes = false
  end
end
