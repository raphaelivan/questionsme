class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.text :description
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
