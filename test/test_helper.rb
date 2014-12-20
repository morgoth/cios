ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"

require "minitest/rails"
require "capybara/rspec/matchers"
require "minitest/rails/capybara"
require "minitest/pride"

class ActiveSupport::TestCase
end

class Capybara::Rails::TestCase
  def sign_in(user)
    visit "/session/new"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end
end
