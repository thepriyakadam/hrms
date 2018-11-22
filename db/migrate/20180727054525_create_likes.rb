class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :topic_comment, index: true, foreign_key: true
      t.boolean :liked

      t.timestamps null: false
    end
  end
end
