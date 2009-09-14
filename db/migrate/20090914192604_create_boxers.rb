class CreateBoxers < ActiveRecord::Migration
  def self.up
    create_table :boxers do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :active
      t.text :about
      t.date :birth_date
      t.string :photo_url

      t.timestamps
    end
  end

  def self.down
    drop_table :boxers
  end
end
