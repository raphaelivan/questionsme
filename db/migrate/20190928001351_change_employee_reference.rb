class ChangeEmployeeReference < ActiveRecord::Migration
  def change
    remove_column :employees, :sector_id
    add_column :employees, :user_id, :integer


    add_index :employees, :user_id
  end
end
