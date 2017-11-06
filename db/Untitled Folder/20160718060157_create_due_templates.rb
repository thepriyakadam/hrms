class CreateDueTemplates < ActiveRecord::Migration
  def change
    create_table :due_templates do |t|
      t.string :code
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
