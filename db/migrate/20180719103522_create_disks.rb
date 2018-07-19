class CreateDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :disks do |t|
      t.references :restaurant, foreign_key: true
      t.string :name, limit: 99
      t.decimal :price,  :precision => 5, :scale => 2

      t.timestamps
    end
  end
end
