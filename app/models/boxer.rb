class Boxer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  default_scope :order => "active DESC, last_name, first_name"

  def full_name
    "#{first_name} #{last_name}"
  end
end
