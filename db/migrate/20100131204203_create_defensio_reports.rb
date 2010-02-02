class CreateDefensioReports < ActiveRecord::Migration
  def self.up
    create_table :defensio_reports do |t|
      t.integer :comment_id
      t.string :signature
      t.boolean :allow
      t.boolean :profanity_match
      t.float :spaminess

      t.timestamps
    end
  end

  def self.down
    drop_table :defensio_reports
  end
end
