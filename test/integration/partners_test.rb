require "test_helper"

class PartnersTest < Capybara::Rails::TestCase
  before { sign_in(FactoryGirl.create(:user)) }

  it "creates partner" do
    visit partners_path
    fill_in "partner_name", :with => "Company"
    select "Partnership", :from => "Kind"
    fill_in "Link", :with => "company.com"
    click_button "Create"

    assert Partner.assistance.exists?(:name => "Company")
  end

  it "changes partners order" do
    skip("requires js driver or changing link to button")

    first = FactoryGirl.create(:partner, :kind => "sponsor", :name => "First")
    second = FactoryGirl.create(:partner, :kind => "sponsor", :name => "Second")
    visit partners_path
    click_link "Move down"

    assert_equal 2, first.reload.position
    assert_equal 1, second.reload.position
  end
end
