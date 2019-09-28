class AddEmailToSector < ActiveRecord::Migration
  def change
    add_column :sectors, :email, :string, default: '', null: false

    add_index :sectors, :email
  end
end
