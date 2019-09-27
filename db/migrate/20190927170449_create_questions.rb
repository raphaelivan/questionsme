class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :slug
      t.string :name
      t.text :description
      t.boolean :open
      t.integer :type

      t.timestamps null: false
    end

    add_index :questions, :compny_id
    add_index :questions, :name
    add_index :questions, :slug
    add_index :questions, :open
  end
end
