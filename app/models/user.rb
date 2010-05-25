class User < ActiveRecord::Base
  acts_as_authentic

  has_many :posts

  before_destroy :destroyable?

  private

  def destroyable?
    User.count != 1
  end
end
