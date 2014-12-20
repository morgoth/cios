class User < ActiveRecord::Base
  has_secure_password

  has_many :posts

  before_destroy :destroyable?

  validates :email, presence: true, uniqueness: true

  private

  def destroyable?
    User.count != 1
  end
end
