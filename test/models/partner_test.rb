require "test_helper"

describe Partner do
  before { @partner = FactoryGirl.build(:partner) }

  it "adds protocol to link if missing" do
    @partner.link = "example.com"
    @partner.save!
    assert_equal "http://example.com", @partner.link
  end

  it "does not add protocol to link if hptts used" do
    @partner.link = "https://example.com"
    @partner.save!
    assert_equal "https://example.com", @partner.link
  end
end
