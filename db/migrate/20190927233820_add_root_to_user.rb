class AddRootToUser < ActiveRecord::Migration
  def change
    add_column :users, :root, :boolean, default: false

    add_index :users, :root
  end
end
