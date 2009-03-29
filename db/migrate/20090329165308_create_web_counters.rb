class CreateWebCounters < ActiveRecord::Migration
  def self.up
    create_table :web_counters do |t|
      t.integer :counter, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :web_counters
  end
end
