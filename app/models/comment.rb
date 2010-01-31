class Comment < ActiveRecord::Base
  belongs_to :post
  has_one :defensio_report

  validates_presence_of :content, :name, :post

  before_create :check_for_spam

  attr_protected :approved, :post_id

  def approve!
    update_state(true)
  end

  def mark_as_spam!
    update_state(false)
  end

  private

  def check_for_spam
    defensio = build_defensio_report
    defensio.post(defensio_attributes)
    self.approved = defensio.approved?
  end

  def update_state(state)
    self.approved = state
    if defensio_report
      defensio_report.put(:allow => state)
    end
    save!
  end

  def defensio_attributes
    {
      "type" => "test",
      "platform" => "rubyonrails",
      "content" => content,
      "author-name" => name
    }
  end
end
