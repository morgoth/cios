require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  setup { @partner = Factory.build(:partner) }

  test "adds protocol to link if missing" do
    @partner.link = "example.com"
    @partner.save!
    assert_equal "http://example.com", @partner.link
  end

  test "does not add protocol to link if hptts used" do
    @partner.link = "https://example.com"
    @partner.save!
    assert_equal "https://example.com", @partner.link
  end
end
