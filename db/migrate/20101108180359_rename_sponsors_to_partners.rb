class RenameSponsorsToPartners < ActiveRecord::Migration
  def self.up
    rename_table("sponsors", "partners")
  end

  def self.down
    rename_table("partners", "sponsors")
  end
end
