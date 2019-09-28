class AddRootToUser < ActiveRecord::Migration
  def change
    add_column :users, :root, :bolean, default: false

    add_index :users, :root
  end
end
