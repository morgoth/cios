ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

class MiniTest::Rails::ActiveSupport::TestCase
end

# Do you want all existing Rails tests to use MiniTest::Rails?
# Comment out the following and either:
# A) Change the require on the existing tests to `require "minitest_helper"`
# B) Require this file's code in test_helper.rb

# MiniTest::Rails.override_testunit!

class Capybara::Rails::TestCase
  def sign_in(user)
    visit destroy_user_session_path
    visit new_user_session_path

    fill_in "Login/Email", with: user.login
    fill_in "Password", with: user.password

    click_button "Log in"
  end
end
