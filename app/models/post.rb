class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy, :order => "created_at ASC"
  default_scope order('created_at DESC')

  validates_presence_of :content, :title

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
