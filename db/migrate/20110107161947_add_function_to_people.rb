class AddFunctionToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :function, :string
  end

  def self.down
    remove_column :people, :function
  end
end
