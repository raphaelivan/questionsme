class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :description
      t.integer :weight
      t.references :ask, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
