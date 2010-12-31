class RenameBoxersToPersons < ActiveRecord::Migration
  def self.up
    rename_table(:boxers, :people)
    add_column(:people, :type, :string)
    add_column(:people, :contact, :string)
    Person.update_all(:type => "Boxer")
  end

  def self.down
    remove_column(:people, :type)
    remove_column(:people, :contact)
    rename_table(:people, :boxers)
  end
end
