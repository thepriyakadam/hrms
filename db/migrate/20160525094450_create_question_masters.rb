class CreateQuestionMasters < ActiveRecord::Migration
  def change
    create_table :question_masters do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
