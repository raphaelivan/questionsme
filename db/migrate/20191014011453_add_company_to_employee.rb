class AddCompanyToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :company_id, :integer, null: false 

    add_index :employees, :company_id
  end
end
