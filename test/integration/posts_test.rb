require "minitest_helper"

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
    fill_in "Title", :with => "Success"
    fill_in "Content", :with => "*great*"
    click_button "Create Post"

    within(".post") do
      assert page.has_selector?("strong")
      assert page.has_content?("great")
    end
  end
end
