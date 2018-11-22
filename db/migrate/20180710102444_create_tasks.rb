class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
