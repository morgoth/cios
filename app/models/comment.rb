class Comment < ActiveRecord::Base
  belongs_to :post
  has_one :defensio_report, dependent: :destroy

  validates_presence_of :content, :name, :post

  before_create :check_for_spam

  scope :approved, where(approved: true)
  scope :not_approved, where(approved: false)

  def approve!
    update_state!(true)
  end

  def mark_as_spam!
    update_state!(false)
  end

  private

  def check_for_spam
    defensio = build_defensio_report
    defensio.post(defensio_attributes)
    self.approved = defensio.approved?
    true
  end

  def update_state!(state)
    self.approved = state
    if defensio_report
      defensio_report.put(allow: state)
    end
    save!
  end

  def defensio_attributes
    {
      "type"        => "comment",
      "platform"    => "rubyonrails",
      "content"     => content,
      "author-name" => name
    }
  end
end
