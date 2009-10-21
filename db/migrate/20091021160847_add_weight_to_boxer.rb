class AddWeightToBoxer < ActiveRecord::Migration
  def self.up
    add_column :boxers, :weight, :integer
  end

  def self.down
    remove_column :boxers, :weight
  end
end
