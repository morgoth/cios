class AddApprovedToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :approved, :boolean
  end

  def self.down
    remove_column :comments, :approved
  end
end
