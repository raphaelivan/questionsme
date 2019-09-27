class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name
      t.references :company

      t.timestamps null: false
    end

    add_index :sectors, :company_id
    add_index :sectors, :name
  end
end
