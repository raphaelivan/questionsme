class AddToCompanyToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :company_id, :integer, null: false 

    add_index :questions, :company_id
  end
end
