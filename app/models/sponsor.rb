class Sponsor < ActiveRecord::Base
  acts_as_list

  validates_presence_of :name
  default_scope order('position')

  before_validation :check_link

  private

  def check_link
    unless link.blank?
      self.link = "http://"+link unless link =~ /^http:\/\//
    end
  end
end
