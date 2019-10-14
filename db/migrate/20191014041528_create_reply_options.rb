class CreateReplyOptions < ActiveRecord::Migration
  def change
    create_table :reply_options do |t|
      t.references :reply, index: true, foreign_key: true
      t.references :ask, index: true, foreign_key: true
      t.references :option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
