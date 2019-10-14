class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :open

      t.timestamps null: false
    end

    add_index :replies, :open
  end
end
