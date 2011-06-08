class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.references :stock
      t.string :interval
      t.datetime :start
      t.integer :o
      t.integer :h
      t.integer :l
      t.integer :c

      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
