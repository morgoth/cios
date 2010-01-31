class DefensioReport < ActiveRecord::Base
  belongs_to :comment
  validates_presence_of :signature, :comment

  delegate :content, :name, :to => :comment, :prefix => true, :allow_nil => true

  def post
    status, attr = DefensioReport.client.post_document(defensio_attributes)
    if status == 200
      self.signature = attr['signature']
      self.spaminnes = attr['spaminnes']
      self.profanity_match = attr['profanity-match']
      self.allow = attr['allow']
    end
  end

  def self.client
    @@defensio ||= Defensio.new("")
  end

  def defensio_attributes
    {
      "type" => "test",
      "platform" => "rubyonrails",
      "content" => comment_content,
      "author-name" => comment_name
    }
  end
end
