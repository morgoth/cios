require 'test_helper'

class PartnersTest < ActionController::IntegrationTest
  setup { sign_in(FactoryGirl.create(:user)) }

  test "creating partner" do
    visit partners_path
    fill_in "Name", :with => "Company"
    select "Partnership", :from => "Kind"
    fill_in "Link", :with => "company.com"
    click_button "Create"

    assert Partner.assistance.exists?(:name => "Company")
  end

  test "changing partners order" do
    first = FactoryGirl.create(:partner, :kind => "sponsor", :name => "First")
    second = FactoryGirl.create(:partner, :kind => "sponsor", :name => "Second")
    visit partners_path
    click_link "Move down"

    assert_equal 2, first.reload.position
    assert_equal 1, second.reload.position
  end
end
