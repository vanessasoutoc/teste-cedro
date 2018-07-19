class AddDeletedAtToDisks < ActiveRecord::Migration[5.1]
  def change
    add_column :disks, :deleted_at, :datetime
    add_index :disks, :deleted_at
  end
end
