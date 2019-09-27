class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.date :born
      t.string :sex
      t.string :email
      t.references :sector

      t.timestamps null: false
    end

    add_index :employees, :sector_id
  end
end
