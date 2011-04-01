class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :encryptable, :encryptor => :authlogic_sha512

  has_many :posts

  before_destroy :destroyable?

  validates :login, :presence => true, :uniqueness => true
  attr_accessible :login, :password, :password_confirmation, :remember_me, :email

  private

  def destroyable?
    User.count != 1
  end

  def self.find_for_authentication(conditions)
    where(["users.login = :auth OR users.email = :auth", {:auth => conditions[:login]}]).first
  end

  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
end
