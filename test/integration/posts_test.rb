require "test_helper"

class PostsTest < Capybara::Rails::TestCase
  before { @user = FactoryGirl.create(:user) }

  it "lists posts" do
    FactoryGirl.create(:post, :title => "simple post", :user => @user)
    sign_in(@user)
    visit posts_path

    assert page.has_content?("simple post")
  end

  it "creates post with markup" do
    sign_in(@user)
    visit new_post_path
    fill_in "post_title", :with => "Success"
    fill_in "post_content", :with => "*great*"
    click_button "Create Post"

    within(".post") do
      assert page.has_selector?("strong")
      assert page.has_content?("great")
    end
  end
end
