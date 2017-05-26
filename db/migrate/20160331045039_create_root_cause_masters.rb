class CreateRootCauseMasters < ActiveRecord::Migration
  def change
    create_table :root_cause_masters do |t|
      t.integer :code
      t.string :name
      t.text :description
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end