class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.string :ip
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
