class UpdateCommentsApprove < ActiveRecord::Migration
  def self.up
    Comment.update_all("approved = 't'")
  end

  def self.down
    Comment.update_all("approved = 'f'")
  end
end
