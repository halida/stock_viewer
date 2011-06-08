class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.references :stock
      t.string :interval
      t.datetime :start
      t.float :o
      t.float :h
      t.float :l
      t.float :c

      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
