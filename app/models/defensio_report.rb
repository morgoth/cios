class DefensioReport < ActiveRecord::Base
  belongs_to :comment
  validates_presence_of :signature, :comment

  def post(defensio_attributes)
    status, attr = DefensioReport.client.post_document(defensio_attributes)
    if status == 200
      self.signature = attr['signature']
      self.spaminnes = attr['spaminnes']
      self.profanity_match = attr['profanity-match']
      self.allow = attr['allow']
    end
  end

  def put(allow)
    DefensioReport.client.put_document(signature, { :allow => allow })
  end

  def self.client
    @@defensio ||= Defensio.new("")
  end

  def approved?
    allow? and !profanity_match?
  end
end
