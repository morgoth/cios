class AddKindToPartners < ActiveRecord::Migration
  def self.up
    add_column :partners, :kind, :string
  end

  def self.down
    remove_column :partners, :kind
  end
end
