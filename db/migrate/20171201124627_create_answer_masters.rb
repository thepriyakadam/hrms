class CreateAnswerMasters < ActiveRecord::Migration
  def change
    create_table :answer_masters do |t|
      t.string :code
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
