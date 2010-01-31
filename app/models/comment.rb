class Comment < ActiveRecord::Base
  belongs_to :post
  has_one :defensio_report

  validates_presence_of :content, :name, :post_id

  after_create :check_for_spam

  def allow?
    defensio_report.try(:allow?) || false
  end

  def spam?
    not allow?
  end

  private

  def check_for_spam
    defensio = build_defensio_report
    defensio.post
    defensio.save!
  end
end
