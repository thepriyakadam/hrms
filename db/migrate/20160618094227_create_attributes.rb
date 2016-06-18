class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :code
      t.string :name
      t.text :definition
      t.boolean :status

      t.timestamps null: false
    end
  end
end
