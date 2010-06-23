class Boxer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  validates_numericality_of :weight, :only_integer => true, :allow_blank => true

  default_scope order("active DESC, last_name, first_name")

  def full_name
    "#{first_name} #{last_name}"
  end
end
