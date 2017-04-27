class CreateInterviewTypes < ActiveRecord::Migration
  def change
    create_table :interview_types do |t|
      t.integer :code
      t.string :name
      t.text :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
