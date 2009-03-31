class AddPositionToSponsors < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :position, :integer
  end

  def self.down
    remove_column :sponsors, :position
  end
end
