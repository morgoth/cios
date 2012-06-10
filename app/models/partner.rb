class Partner < ActiveRecord::Base
  KINDS = %w(sponsor assistance)
  acts_as_list :scope => 'kind = \'#{kind}\''

  validates :name, presence: true
  validates :kind, presence: true, inclusion: KINDS

  scope :ordered, order("kind, position")
  scope :sponsor, where(kind: "sponsor")
  scope :assistance, where(kind: "assistance")

  before_validation :check_link_format

  private

  def check_link_format
    unless link.blank?
      self.link = "http://" + link unless link =~ /^https?:\/\//
    end
  end
end
