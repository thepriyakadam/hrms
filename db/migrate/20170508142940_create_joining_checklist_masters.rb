class CreateJoiningChecklistMasters < ActiveRecord::Migration
  def change
    create_table :joining_checklist_masters do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status , default: false 

      t.timestamps null: false
    end
  end
end
