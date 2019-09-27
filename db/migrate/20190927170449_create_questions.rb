class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :company
      t.string :name
      t.boolean :open
      t.integer :type

      t.timestamps null: false
    end

    add_index :questions, :compny_id
    add_index :questions, :name
    add_index :questions, :open
  end
end
