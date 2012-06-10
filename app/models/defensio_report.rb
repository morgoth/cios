class DefensioReport < ActiveRecord::Base
  belongs_to :comment
  validates_presence_of :signature, :comment

  def self.client
    @@defensio ||= Defensio.new(ENV['DEFENSIO_API_KEY'] || "nonexisting")
  end

  def post(defensio_attributes)
    status, attr = DefensioReport.client.post_document(defensio_attributes)
    build_log attr
    if status == 200
      self.signature = attr['signature']
      self.spaminess = attr['spaminess']
      self.profanity_match = attr['profanity-match']
      self.allow = attr['allow']
    end
  end

  def put(allow)
    DefensioReport.client.put_document(signature, {allow: allow})
  end

  def approved?
    allow? and !profanity_match?
  end

  def build_log(msg)
    logger.info "Defensio report\n " << msg.to_s << "\n"
  end
end
